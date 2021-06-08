package com.school.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.commons.codec.binary.Base64;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
	 
	@SuppressWarnings("unused")
	public class RsaUtils {
	    public static final String KEY_ALGORITHM = "RSA";
	    public static final String SIGNATURE_ALGORITHM = "MD5withRSA";
	    private static final String PUBLIC_KEY = "RSAPublicKey";
	    private static final String PRIVATE_KEY = "RSAPrivateKey";
	public static String getPublicKey(Map<String, Object> keyMap) throws Exception {
	         Key key = (Key) keyMap.get(PUBLIC_KEY); 
	         byte[] publicKey = key.getEncoded(); 
	return encryptBASE64(key.getEncoded());
	}
	 
	public static String getPrivateKey(Map<String, Object> keyMap) throws Exception {
	         Key key = (Key) keyMap.get(PRIVATE_KEY); 
	         byte[] privateKey =key.getEncoded(); 
	return encryptBASE64(key.getEncoded());
	}  
	           
	    public static byte[] decryptBASE64(String key) throws Exception {    
	    	//解密
	        return (new BASE64Decoder()).decodeBuffer(key);               
	    }                                 
	               
	    public static String encryptBASE64(byte[] key) throws Exception { 
	    	//加密
	        return (new BASE64Encoder()).encodeBuffer(key);               
	    }   
	    public static String testDecrypt(String key,String data) throws NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, InvalidKeySpecException, IllegalBlockSizeException, BadPaddingException, IOException{
	        byte[] keyBytes = Base64.decodeBase64(key);
	        byte[] bytes = Base64.decodeBase64(data);

	        PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
	        KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
	        Key privateK = keyFactory.generatePrivate(pkcs8KeySpec);
	        Cipher ci = Cipher.getInstance(keyFactory.getAlgorithm());
	        ci.init(Cipher.DECRYPT_MODE, privateK);  
	        int inputLen = bytes.length;
	        int offLen = 0;
	        int i = 0;

	         ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

	          while(inputLen - offLen > 0){

	               byte[] cache=null;

	               if(inputLen - offLen > 128){

	                cache = ci.doFinal(bytes,offLen,128); 

	               }else{
	                  cache = ci.doFinal(bytes,offLen,inputLen - offLen);

	               }
	             byteArrayOutputStream.write(cache);
	               i++;

	              offLen = 128 * i;
	          }

	         byteArrayOutputStream.close();

	        byte[] byteArray = byteArrayOutputStream.toByteArray();
	         return new String(byteArray);
	     }
	    
	public static Map<String, Object> initKey() throws Exception {
		//将公钥和私钥存储在map中
	KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance(KEY_ALGORITHM);
	keyPairGen.initialize(1024);
	KeyPair keyPair = keyPairGen.generateKeyPair();
	 
	RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
	RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
	 
	Map<String, Object> keyMap = new HashMap<String, Object>(2);
	keyMap.put(PUBLIC_KEY, publicKey);
	keyMap.put(PRIVATE_KEY, privateKey);
	 
	return keyMap;
	}
}

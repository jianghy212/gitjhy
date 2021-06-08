package com.school.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * hashmap加密存储
 *
 */
public class HashUtils {
	
//  String str;
   static Map<Character,Character> map=new HashMap<Character,Character>();//加密
   static  Map<Character,Character>map1=new HashMap<Character,Character>();//解密
   public HashUtils(){
	   //加密和解密的字符串长度和内容一致
        String a="abcdefghijklmnopqrstuvwsvz*1234567890.~`!@#$%^&*()_=+-|[]}{?,<>";//加密的字符串
        String b="veknohzfiljxdmygbrcswqupta*9874563210.~^&*()_=+-|[]}{?,<>`!@#$%";//解密的字符串
        for(int i=0;i<a.length();i++){
            map.put(a.charAt(i),b.charAt(i));//加密字符串作为key,解密作为value
            map1.put(b.charAt(i),a.charAt(i));//解密字符串作为key,加密作为value
        }
    }
   public  static String encrypt(String str){
	   
       String s2= str.toLowerCase();//把字符串转换为小写
       String d = "";
       for (int i = 0; i < s2.length(); i++) {
           d = d + map.get(s2.charAt(i));//charAT()检索特定索引下的字符
       }
       return d;
    }
    public static String decrypt(String str){
        String d = "";
        for (int i = 0; i < str.length(); i++) {
            d = d + map1.get(str.charAt(i));
        }
        return d;
    }
   
    
 
}

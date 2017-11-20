package com.shuodao.hrms.util;

import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.binary.Base64;

public class DESCodec {  
    //�㷨���  
    public static final String KEY_ALGORITHM = "DES";  
    //�㷨���/����ģʽ/��䷽ʽ  
    //DES�������ֹ���ģʽ-->>ECB���������뱾ģʽ��CBC�����ܷ�������ģʽ��CFB�����ܷ���ģʽ��OFB���������ģʽ  
    public static final String CIPHER_ALGORITHM = "DES/ECB/PKCS5Padding";  
    
    private static final String DEFAULT_KEY = "g5S5m83yq8c=";
    private static final String IDENTITY = "weixin:";
    
    /** 
     * �����Կ 
     */  
    public static String initkey() throws NoSuchAlgorithmException {  
        KeyGenerator kg = KeyGenerator.getInstance(KEY_ALGORITHM); //ʵ����Կ�����  
        kg.init(56);                                               //��ʼ����Կ�����  
        SecretKey secretKey = kg.generateKey();                    //�����Կ  
        return Base64.encodeBase64String(secretKey.getEncoded());  //��ȡ��������Կ������ʽ  
    }  
  
    /** 
     * ת����Կ 
     */  
    private static Key toKey(byte[] key) throws Exception {  
        DESKeySpec dks = new DESKeySpec(key);                                      //ʵ��Des��Կ  
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(KEY_ALGORITHM); //ʵ����Կ����  
        SecretKey secretKey = keyFactory.generateSecret(dks);                      //�����Կ  
        return secretKey;  
    }  
      
    /** 
     * ������� 
     * @param data �������� 
     * @param key  ��Կ 
     * @return ���ܺ����� 
     */  
    public static String encrypt(String data, String key) throws Exception {  
        Key k = toKey(Base64.decodeBase64(key));                           //��ԭ��Կ  
        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);              //ʵ��Cipher�������������ʵ�ʵļ��ܲ���  
        cipher.init(Cipher.ENCRYPT_MODE, k);                               //��ʼ��Cipher��������Ϊ����ģʽ  
        return Base64.encodeBase64String(cipher.doFinal(data.getBytes())); //ִ�м��ܲ��������ܺ�Ľ��ͨ��������Base64������д���  
    }  
      
    /** 
     * ������� 
     * @param data �������� 
     * @param key  ��Կ 
     * @return ���ܺ����� 
     */  
    public static String decrypt(String data, String key) throws Exception {  
        Key k = toKey(Base64.decodeBase64(key.getBytes()));  
        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);  
        cipher.init(Cipher.DECRYPT_MODE, k);                           //��ʼ��Cipher��������Ϊ����ģʽ  
        return new String(cipher.doFinal(Base64.decodeBase64(data.getBytes())));  //ִ�н��ܲ���  
    }  
    
    public static String encrypt(String data) throws Exception {
    	return encrypt(IDENTITY  + data, DEFAULT_KEY).replace('+', '*').replace('/', '-').replace('=', '.');
    }
    
    public static String decrypt(String data) throws Exception {
    	if (data != null) {
    		data = data.replace('.', '=').replace('*', '+').replace('-', '/');
    	}
    	data = decrypt(data, DEFAULT_KEY);
    	if (data.startsWith(IDENTITY)) {
    		return data.substring(IDENTITY.length());
    	}
    	return null;
    }
      
    public static void main(String[] args) throws Exception {  
        String source = "orv14jqY-fnyGCWCzAruwYQ023Go";  
        System.out.println("ԭ��: " + source);  
          
        String key = initkey();  
        System.out.println("��Կ: " + key);  
          
        String encryptData = encrypt(source);  
        System.out.println("����: " + encryptData);  
          
        String decryptData = decrypt(encryptData);  
        System.out.println("����: " + decryptData);  
    }  
}  
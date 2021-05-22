package practice;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class security {
	static public String hashPass(String pass)
	{
		String Pass = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] int_pass = md5.digest(pass.getBytes());
			BigInteger no = new BigInteger(1, int_pass);
			Pass = no.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return Pass;
	}
}

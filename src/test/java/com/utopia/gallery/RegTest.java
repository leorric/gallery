package com.utopia.gallery;

import org.junit.Test;
import static org.junit.Assert.*;
public class RegTest {
	
	@Test
	public void testReg() {
		String s= "-----------------------------20898292629059--";
		boolean b = s.endsWith("--");
		assertTrue(b);
	}
	
	@Test
	public void testGetFilename() {
		String s = "Content-Disposition: form-data; name=\"img_url\"; filename=\"laker.jpg\"";
		System.out.println(s);
		int i = s.indexOf("filename=");
		s = s.substring(i+10,s.length()-1);
		System.out.println(s);
	}
}

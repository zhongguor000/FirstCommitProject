package com.lruikmy.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;

public class RandomIOUtil {
	private static final int DEFAULT_BUFFER_SIZE = 1024 * 4;
	
	
	public static long copy(InputStream input, RandomAccessFile output,long start) throws IOException{
		byte[] buffer=new byte[DEFAULT_BUFFER_SIZE];
		int available = input.available();
		if(start>available){
			start=available;
		}
		input.skip(start);
		output.seek(start);
        int n = 0;
        try {
			n=input.read(buffer);
			while (-1 != n ) {
			    output.write(buffer, 0, n);
			    start += n;
			    System.out.println(start);
			    n=input.read(buffer);
			}
		} catch (Exception e) {
			return start;
		}
        return start;
    }
	
}

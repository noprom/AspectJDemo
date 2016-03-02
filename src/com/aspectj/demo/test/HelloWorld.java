package com.aspectj.demo.test;

public class HelloWorld {

	public static void main(int i) {
		System.out.println("in the main method i = " + i);
	}

	public static void main(String[] args) {
		main(5);
	}

}

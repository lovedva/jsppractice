package test;
import model.*;

public class EmptyCheck {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("\"\"  ���ַ����Խ��="+IsEmpty.Checkisempty(""));
		System.out.println("\"    \"  �ո��ַ����Խ��="+IsEmpty.Checkisempty("    "));
		System.out.println("\"    Hello\"  ��ͨ�ַ����Խ��="+IsEmpty.Checkisempty("    Hello"));
		System.out.println("\"Hello    \"  ��ͨ�ַ����Խ��="+IsEmpty.Checkisempty("Hello    "));
		System.out.println("\",    \"  ��ͨ�ַ����Խ��="+IsEmpty.Checkisempty(",    "));

	}

}

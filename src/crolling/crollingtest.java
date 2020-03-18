package crolling;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;

public class crollingtest {

	public static void main(String[] args) {
		// Jsoup�� �̿��� ����� Ȩ������ �������� ũ�Ѹ�
		String url = "https://www.sungkyul.ac.kr/mbs/skukr/jsp/board/list.jsp?boardId=29&id=skukr_060102000000";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// ���� ���ϴ� ������ <tr class="notice">
		Elements element = doc.select("tr.notice");
		ArrayList<String> list = new ArrayList<String>();
		
		for(Element el : element.select("a")) {	//<tr class="notice"> �߿��� a�±� ���� �����������̰� �ʹ� 
			System.out.println(el.attr("href"));
			//list.add(el.text());
		}
		
	}
	
	public static ArrayList<String> test() {
		String url = "https://www.sungkyul.ac.kr/mbs/skukr/jsp/board/list.jsp?boardId=29&id=skukr_060102000000";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// ���� ���ϴ� ������ <tr class="notice">
		Elements element = doc.select("tr.notice");
		ArrayList<String> list = new ArrayList<String>();
		
		for(Element el : element.select("a")) {	//<tr class="notice"> �߿��� a�±� ���� �����������̰� �ʹ� 
			//System.out.println(el.text());
			list.add(el.text());
		}
		return list;
	}
	
	public static ArrayList<String> href(){
		String url = "https://www.sungkyul.ac.kr/mbs/skukr/jsp/board/list.jsp?boardId=29&id=skukr_060102000000";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// ���� ���ϴ� ������ <tr class="notice">
		Elements element = doc.select("tr.notice");
		ArrayList<String> list = new ArrayList<String>();
		
		for(Element el : element.select("a")) {	//<tr class="notice"> �߿��� a�±� ���� �����������̰� �ʹ� 
			//System.out.println(el.text());
			list.add(el.attr("href"));  //tr.notice>a href="" �� �̰����
		}
		return list;
	}

}

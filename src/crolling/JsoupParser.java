package crolling;

import java.io.IOException;
import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;

public class JsoupParser {
	
	/*
     *	Document Ŭ���� : �����ؼ� ���� HTML ��ü ����
     *	Element Ŭ����  : Documnet�� HTML ���
     *	Elements Ŭ���� : Element�� ���� �ڷ���
	 */
	
	public static void main(String[] args) {
		// Jsoup�� �̿��ؼ� ���̹� ������ ũ�Ѹ�
		String url = "https://sports.news.naver.com/wfootball/index.nhn";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// �ֿ� ������ ������ �±׸� ã�Ƽ� ���������� �Ѵ�.
		Elements element = doc.select("div.home_news");
		
		// 1. ��� �κ��� ������ �����´�.
		String title = element.select("h2").text().substring(0, 4);

		System.out.println("============================================================");
		System.out.println(title);
		System.out.println("============================================================");
		for(Element el : element.select("li")) {	// ���� ���� ������ for�� ���鼭 ���
			System.out.println(el.text());	
		}
		for(Element a : element.select("a")) {
			System.out.println(a.attr("href"));
			
		}
		
		System.out.println("============================================================");
	}
}

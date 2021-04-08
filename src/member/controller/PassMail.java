package member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import member.service.ImemberService;
import member.service.MemberServiceImpl;

@WebServlet("/passMail.do")
public class PassMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

//		// 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
//
//		// String m = new memberVO();
		ImemberService service = MemberServiceImpl.getInstance();
		String mem_id = service.getId(id);
		if (!id.equals(mem_id)) {
			request.setAttribute("msg", mem_id);
			request.getRequestDispatcher("member/ReId.jsp").forward(request, response);
			return;
		}

		// mail server 설정
		String host = "smtp.gmail.com";
		final String user = "bsjin7231@gmail.com"; // 자신의메일계정
		final String password = "";// 자신의 메일 패스워드

		// 메일 받을 주소
		/* String to_email = m.getEmail(); */
		String to_email = id;

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();
		System.out.println(AuthenticationKey);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "See-Avi"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요  See-avi 임시 비밀번호 메일입니다.");
			// 메일 내용
			msg.setText("임시 비밀번호 : " + temp + "\n 인증번호를 정확하게 입력해주세요." + "\n 감사합니다.");

			Transport.send(msg);
			System.out.println("이메일 전송");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		// RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
		// rd.forward(request, response);
//		HttpSession saveKey = request.getSession();
//		saveKey.setAttribute("rPass", AuthenticationKey);
		memberVO vo = new memberVO();
		vo.setPass(AuthenticationKey);
		vo.setMem_id(id);
		int cnt = service.updatePw(vo);
		request.setAttribute("cnt", cnt);
		System.out.println(vo);
		request.getRequestDispatcher("member/RandomPw.jsp").forward(request, response);

	}

//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		String AuthenticationKey = (String) request.getSession().getAttribute("AuthenticationKey");
//		String AuthenticationUser = request.getParameter("code");
//		if (!AuthenticationKey.equals(AuthenticationUser)) {
//			System.out.println("비밀번호 일치하지 않음");
//			request.setAttribute("pw", "인증번호가 일치하지 않습니다");
//		}
//		request.getRequestDispatcher("member/CodeCheck.jsp").forward(request, response);
//	}
}

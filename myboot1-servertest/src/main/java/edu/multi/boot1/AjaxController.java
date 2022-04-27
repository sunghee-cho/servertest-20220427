package edu.multi.boot1;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxController {

//get+post 모두 기본(전송데이터없음)
@CrossOrigin(origins="*")
@RequestMapping("/helloajax")
@ResponseBody
public MemberDTO test() {
   return new MemberDTO("ID","PASSWORD");//json자동변환(스프링부트내장)
}

//get + 전송데이터있음
//주의할 점으로 GET 통신에서는 @RequestParam을 사용하지만, POST 통신에서는 @RequestBody를 사용한다.
@CrossOrigin(origins="*")
@GetMapping("/helloajaxparam")
@ResponseBody
public MemberDTO test(String id , int password ) {
   return new MemberDTO(id,"PASSWORD"+password);//json자동변환(스프링부트내장)
}

@CrossOrigin(origins="*")
@PostMapping("/helloajaxparam")
@ResponseBody
public MemberDTO test2(@RequestBody LoginDTO dto) {
   return new MemberDTO(dto.getId(),"PASSWORD"+dto.getPassword());//json자동변환(스프링부트내장)
}

}

class LoginDTO{
	String id;
	int password;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	
}



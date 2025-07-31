package kr.soft.study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "redirect:/test";
    }

    @GetMapping("/test")
    public String test() {

        System.out.println("test하기");

        return "test.html";
    }
}

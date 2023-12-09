import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/index")
    public String sayHello() {
        return "index"; // This corresponds to the name of the HTML file (hello.html)
    }

    @GetMapping("/")
    public String showIndex() {
        return "index";
    }
}

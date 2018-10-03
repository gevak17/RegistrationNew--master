package gevak.controller;

import gevak.controller.dto.GidrantDTO;
import gevak.dao.DaoAuth;
import gevak.entity.Gidrant;
import gevak.entity.User;
import gevak.entity.UserLogin;
import gevak.service.GidrantService;
import gevak.service.PoligonsService;
import gevak.service.UserLoginService;
import gevak.service.UserService;
import javafx.stage.Window;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;
import java.util.Set;

@Controller
public class MainController {

    @Autowired
    UserService userService;

    @Autowired
    GidrantService gidrantService;

    @Autowired
    UserLoginService userLoginService;

//    @Autowired
//    UserLoginService userLoginService;

    @Autowired
    PoligonsService poligonsService;

    @GetMapping("/testPoligon")
    public String testPoligon() {
//        Gidrant gidrant = gidrantService.findOne(11497);
//        System.out.println("execute nativeQuery() - ");
//        String point = "POINT(" + gidrant.getLng() + " " + gidrant.getLat() + ")";
//        System.out.println("gidrantService.findByAdminrayon_id() - "+gidrantService.findByAdminrayon_id());

//        System.out.println("test - "+poligonsService.isPointInPoligon(372, point));

        return "welcome";
    }




    @GetMapping("/")
    public String start() {
        return "welcome";
    }



    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/user")
    public String userPage(Principal principal, Model model) {
//        System.out.println("principal - "+principal.getName());
        User user = userService.findByUserName(principal.getName());
        Set<UserLogin> userLogins = userLoginService.findByUser(user.getId());
//        Set<UserLogin> userLogins = DaoAuth.getUser().getUserLogins();
//        for (UserLogin userLogin : userLogins) {
//            System.out.println(userLogin);
//        }
        model.addAttribute("user", userLogins);
        model.addAttribute("allGidrants", gidrantService.findOne(11000));
        return "user";
    }

//    @GetMapping("/findUser")
//    public @ResponseBody User findAuthorizedUser(){
//        User user = userService.findOne(DaoAuth.getUserId());
//        System.out.println("User name is - "+user.getName());
//        return user;
//    }

    @GetMapping("/admin")
    public String adminPage(Model model) {
        model.addAttribute("allUser", userService.findAll());
        return "admin";
    }

//    @GetMapping("/findOneUser-{findId}")
//    public @ResponseBody User findOneUser(@PathVariable("findId") int findId) {
//        User user = userService.findOne(findId);
//        System.out.println("User id - "+findId);
//        if(DaoAuth.getUser()!=null){
//            System.out.println(DaoAuth.getUser());
//        }
//        return user;
//    }

//    @GetMapping("delete-{id}")
//    public String deleteUser(@PathVariable("id") int id) {
////        User user = userService.findOne(id);
//        System.out.println(id+"  - id");
////        model.addAttribute("Delete", userService.findOne(id));
//        userService.deleteOne(id);
//        System.out.println(userService.findOne(id).getSurname()+" was deleted");
//        return "redirect:/admin";
//    }

    //    @GetMapping("/registration")
//    public String registration() {
//        return "registration";
//    }


//    @PostMapping("/save")
//    public String save(@RequestParam String username,
//                       @RequestParam String password,
//                       @RequestParam String email,
//                       @RequestParam String surname,
//                       @RequestParam String name,
//                       @RequestParam int age,
//                       @RequestParam int pidrozdil_id) {
//        userService.save(username, password, email, surname, name, age, pidrozdil_id);
//        return "redirect:/";
//    }
//    @GetMapping("/allUser")
//    public String selectAllUser(Model model) {
//        model.addAttribute("allUser", userService.findAll());
//        return "allUser";
//    }

    @GetMapping("/getAllUsers")//REST request
    public @ResponseBody List<User> getAllUsers() {
        System.out.println("-------------!!!!!!!!!!!!!!!!!getAllUsers!!!!!!!!!!!!!!!!!-------------");
        return userService.findAll();
    }
    @GetMapping("/getAllGidrantsStreets")//REST request
    public @ResponseBody List<String> getAllGidrantsStreets() {
        System.out.println("-------------!!!!!!!!!!!!!!!!!getAllGidrantsStreets!!!!!!!!!!!!!!!!!-------------");
        return gidrantService.getAllGidrantsStreets();
    }

//    @GetMapping("/getAllGidrants")//REST request
//    public /*@ResponseBody List<Gidrant>*/ String getAllGidrants(Model model) {
//        System.out.println("-------------!!!!!!!!!!!!!!getAllGidrants!!!!!!!!!!!!!!!!!-------------");
//        return "redirect:/user";
//    }


//    @PostMapping("/saveGidrant")
//    public String saveGidrant(@RequestParam double lng,
//                              @RequestParam double lat,
//                              @RequestParam String street_txt,
//                              @RequestParam String bud,
//                              @RequestParam String zrazok,
//                              @RequestParam String diametr,
//                              @RequestParam String typ,
//                              @RequestParam int spravnyi,
//                              @RequestParam int vkazivnyk) {
//        Gidrant gidrant = new Gidrant(lng, lat, street_txt, bud, zrazok, diametr, typ, spravnyi, vkazivnyk);
//        gidrantService.save(gidrant);
//        return "redirect:/user";
//    }

    @GetMapping("/findOneGidrant-{id}")
    public @ResponseBody Gidrant findOneGidrant(@PathVariable("id") int id, Principal principal) {
//        DaoAuth.getUserId()
        Gidrant gidrant = gidrantService.findOne(id);
//        System.out.printf("id:%s\tп:%s\t p:%s\n"
//                ,gidrant.getId()
//                , gidrant.getPidrozdil_id(),gidrant.getAdminrayon_id());

        User user = userService.findByUserName(principal.getName());
        Set<UserLogin> userLogins = userLoginService.findByUser(user.getId());
        System.out.printf("Гідрант\n id: %s\tпідрозділ: %s\n",gidrant.getId(),gidrant.getPidrozdil_id());
        for (UserLogin userLogin : userLogins) {
            Integer pidrozdil_idLogin = userLogin.getPidrozdil_id();
            if (pidrozdil_idLogin == gidrant.getPidrozdil_id()) {
                System.out.println("Користувач "+user.getName()+" має право змінити гідрант");
                return gidrant;
            }
        }
        System.out.println("!!! Користувач "+user.getName()+" не має право змінити гідрант");
        return null;

//        return gidrant;
    }

    @PostMapping("/editGidrant")
    public String editGidrant(
                              @RequestParam int id,
                              @RequestParam double lng,
                              @RequestParam double lat,
                              @RequestParam String street_txt,
                              @RequestParam String bud,
                              @RequestParam String zrazok,
                              @RequestParam String diametr,
                              @RequestParam String typ,
                              @RequestParam int spravnyi,
                              @RequestParam int vkazivnyk,
                              Principal principal) throws UnsupportedEncodingException {

        street_txt = new String(street_txt.getBytes("ISO-8859-1"),"UTF-8");
        zrazok = new String(zrazok.getBytes("ISO-8859-1"),"UTF-8");
        typ = new String(typ.getBytes("ISO-8859-1"), "UTF-8");

//        User currentUser = userService.findByUserName(principal.getName());

        Integer adminrayonId = gidrantService.findOne(id).getAdminrayon_id();
        String point = "POINT(" + lng + " " + lat + ")";
        System.out.println("Точка в полігоні: "+poligonsService.isPointInPoligon(adminrayonId, point));
        if (poligonsService.isPointInPoligon(adminrayonId, point)){
            System.out.println();
            Gidrant gidrant = new Gidrant(id, lng, lat, street_txt, bud, zrazok, diametr, typ, spravnyi, vkazivnyk);
            gidrantService.edit(gidrant);
            System.out.println("Гідрант редаговано");
        } else {
            System.out.println("Гідрант не редаговано");
        }
        return "redirect:/user";
    }



}
//    @PostMapping("/editGidrant")
//    public String editGidrant(@ModelAttribute("gidrant") Gidrant gidrant) {
//        System.out.println("--------edit 1111111");
//        gidrantService.edit(gidrant);
//        System.out.println("--------edit 3333333");
//
//        return "redirect:/user";
//    }
//    @PostMapping("/editUser")
//    public String editUser(@ModelAttribute("user1") @Valid User user, BindingResult result,
//                           @RequestParam("ava") MultipartFile multipartFile) {
//
//        if (result.hasErrors()) {
//            return "edit";
//        }       //validator
//
//        if (multipartFile == null){
//
//            String realPath = System.getProperty("user.home") + File.separator + "images" + File.separator;
//            try {
//                multipartFile.transferTo(new File(realPath + multipartFile.getOriginalFilename()));
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            user.setAvatar(File.separator + "avatar" + File.separator + multipartFile.getOriginalFilename());
//            user.setAvatar(user.getAvatar());
//
//        }else {
//            System.out.println("Edit user it happened!");
//        }
//
//
//
//
//        userService.edit(user);
////        return "index";
//        return "welcome";
//    }
//}

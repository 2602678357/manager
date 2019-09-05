package com.web;

import com.entity.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StudentService;
import com.service.UserService;
import com.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.util.List;

@RestController
@RequestMapping("/student")
public class studentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    /**
     * 用户登陆
     */
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    /**
     * 实验界面
     */
    @RequestMapping(value = "/test2",method = RequestMethod.GET)
    public ModelAndView test(){
        return new ModelAndView("test2");
    }

    private final ResourceLoader resourceLoader;

    @Autowired
    public studentController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    @Value("${web.upload-path}")
    private String path;

    /**
     * 跳转到文件上传页面
     * @return
     */
    @RequestMapping("/test")
    public ModelAndView toUpload(){
        return new ModelAndView("test");
    }

    /**
     *
     * @param file 要上传的文件
     * @return
     */
    @RequestMapping("/fileUpload")
    public ModelAndView upload(@RequestParam("fileName") MultipartFile file, Map<String, Object> map){

        // 要上传的目标文件存放路径
        String localPath = "E:/Develop/Files/Photos";
        // 上传成功或者失败的提示
        String msg = "";

        if (FileUtils.upload(file, localPath, file.getOriginalFilename())){
            // 上传成功，给出页面提示
            msg = "上传成功！";
        }else {
            msg = "上传失败！";

        }

        // 显示图片
        map.put("msg", msg);
        map.put("fileName", file.getOriginalFilename());

        return new ModelAndView("test");
    }

    /**
     * 显示单张图片
     * @return
     */
    @RequestMapping("/show")
    public ResponseEntity showPhotos(String fileName){

        try {
            // 由于是读取本机的文件，file是一定要加上的， path是在application配置文件中的路径
            return ResponseEntity.ok(resourceLoader.getResource("file:" + path + fileName));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }


    /**
     * 检查登录
     *
     * @param userName
     * @return
     */
    @RequestMapping(value = "/check",method = RequestMethod.POST)
    public Map<String, Object> userLogin(@RequestParam("userName") String userName,
                                         @RequestParam("passWord") String passWord,@RequestParam("checkcode")String checkcode, HttpSession session) {
        User user = userService.userLogin(userName, passWord);
        String code =(String) session.getAttribute("number");
        Map<String, Object> map = new HashMap<>();
        map.put("user", user);
        session.setAttribute("user", user);
        if (user != null && user.getStatus() == 1&&checkcode!=null&&checkcode.length()!=0&&code.equalsIgnoreCase(checkcode)) {
            return map;
        }else{
            return null;
        }
    }

    /**
     * 验证码
     * @param response
     * @param session
     * @throws IOException
     */
    @GetMapping("/createImage")
    public void createImage(HttpServletResponse response, HttpSession session) throws IOException {
        BufferedImage image = new BufferedImage(80, 30, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        Random r = new Random();
        g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
        g.fillRect(0, 0, 80, 20);
        //获取生成的验证码
        String code = getNumber();
        //绑定验证码
        session.setAttribute("number", code);
        g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 25));
        g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
        g.drawString(code, 5, 25);
        //设置消息头
        response.setContentType("image/jpeg");
        OutputStream os = response.getOutputStream();
        ImageIO.write(image, "jpeg", os);
    }
    public String getNumber(){
        String str = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String code = "";
        for(int i= 0;i<4;i++){
            int index = (int)(Math.random()*str.length());
            code+=str.charAt(index);
        }
        return code;
    }

    /**
     * 返回分页数据
     * @param currentPage
     * @return
     */

   /* @RequestMapping(value = "/Page", method = RequestMethod.GET)
    public ModelAndView getAll(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<Info> list = studentService.getAll();
        List<teacher> list2=studentService.getAllTeacher();
        PageInfo<Info> pageInfo = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list2",list2);
        map.put("list", list);
        map.put("pageInfo", pageInfo);
        return  new ModelAndView("index",map);
    }*/
    @RequestMapping(value = "/Page6", method = RequestMethod.GET)
    public ModelAndView getAll(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<Info> list = studentService.getAll();
        List<teacher> list2=studentService.getAllTeacher();
        List<course> list3=studentService.getAllCourse2();
        PageInfo<Info> pageInfo = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list3",list3);
        map.put("list2",list2);
        map.put("list", list);
        map.put("pageInfo", pageInfo);
        return  new ModelAndView("index6",map);
    }


    /**
     * 分页老师信息
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/Page2", method = RequestMethod.GET)
    public ModelAndView getAllteacher(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<teacher> list = studentService.getAllTeacher();
        PageInfo<teacher> pageInfo = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        map.put("pageInfo", pageInfo);
        return  new ModelAndView("index2",map);
    }

    /**
     * 分页学生信息
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/Page3", method = RequestMethod.GET)
    public ModelAndView getAllStudent(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<student> list = studentService.getAllStudent();
        PageInfo<student> pageInfo = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        map.put("pageInfo", pageInfo);
        return  new ModelAndView("index3",map);
    }
    /**
     * 分页课程信息
     */
    @RequestMapping(value = "/Page4", method = RequestMethod.GET)
    public ModelAndView getAllCourse(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        PageHelper.startPage(currentPage, 5);
        List<course> list = studentService.getAllCourse();
        PageInfo<course> pageInfo = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        map.put("pageInfo", pageInfo);
        return  new ModelAndView("index4",map);
    }


    /**
     * 删除学生
     * @param sid
     */
    @RequestMapping(value = "/deleteStudent",method = RequestMethod.POST)
    public void deleteStudent(@RequestParam Integer sid){ studentService.deleteStudent(sid); }

    /**
     *
     * 删除老师
     * @param tid
     */
    @RequestMapping(value = "/deleteTeacher",method = RequestMethod.POST)
    public void deleteTeacher(@RequestParam Integer tid){
        studentService.deleteTeacher(tid);
    }

    /**
     * 删除课程
     * @param cid
     */
    @RequestMapping(value = "/deleteCourse",method = RequestMethod.POST)
    public void deleteCourse(@RequestParam Integer cid){studentService.deleteCourse(cid);}
    /**
     * 删除学生
     */
    @RequestMapping(value = "/deleteStudent2",method = RequestMethod.POST)
    public void deleteStudent2(@RequestParam Integer sid){
        studentService.deleteStudent(sid);
    }
    /**
     * 保存学生
     * @param sname
     * @param sage
     * @param ssex
     * @return
     */
    @RequestMapping(value = "/saveStudent", method = RequestMethod.POST)
    public ModelAndView insertStudent(@RequestParam String sname,
                              @RequestParam Integer sage,
                              @RequestParam String ssex){
        student student=new student();
        student.setSname(sname);
        student.setSage(sage);
        student.setSsex(ssex);
        studentService.insertStudent(student);
        return new ModelAndView("success");
    }

    /**
     * 保存教师信息
     * @param tname
     * @return
     */
    @RequestMapping(value = "/saveTeacher",method = RequestMethod.POST)
    public ModelAndView insertTeacher(@RequestParam String tname){
        teacher teacher=new teacher();
        teacher.setTname(tname);
        studentService.insertTeacher(teacher);
        return new ModelAndView("success");
    }

    /**
     * 根据Id获取信息
     * @param sid
     * @return
     */
    @RequestMapping(value = "/updateStudent",method = RequestMethod.POST)
    public Info getInfo(@RequestParam Integer sid){
        return studentService.getInfo(sid);
    }

    /**
     * 根据Id获取教师信息
     * @param tid
     * @return
     */
    @RequestMapping(value = "/updateTeacher",method = RequestMethod.POST)
    public teacher getTeacher(@RequestParam Integer tid){
        return studentService.getTeacher(tid);
    }

    /**
     * 更新数据
     * @param info 返回实体bean
     * @return
     */
    @RequestMapping(value = "/updateStudent2",method = RequestMethod.POST)
    public ModelAndView updateStudent(Info info){
        student student=new student();
        student.setSid(info.getSid());
        student.setSage(info.getSage());
        student.setSsex(info.getSsex());
        student.setSname(info.getSname());
        course course=new course();
        course.setCname(info.getCname());
        course.setCid(info.getCid());
        course.setTid(info.getTid());
        teacher teacher=new teacher();
        teacher.setTname(info.getTname());
        teacher.setTid(info.getTid());
        score scorel=new score();
        scorel.setScore(info.getScore());
        scorel.setCid(info.getCid());
        scorel.setSid(info.getSid());
        studentService.updateStudent(student);
        studentService.updateTeacher(teacher);
        studentService.updateCourse(course);
        studentService.updateScore(scorel);
        return new ModelAndView("success");
    }

    /**
     * 更新学生
     * @param sid
     * @param sname
     * @param sage
     * @param ssex
     * @return
     */
    @RequestMapping(value = "/updateStudent3",method = RequestMethod.POST)
    public ModelAndView updateStudent3(@RequestParam Integer sid,
                                      @RequestParam String sname,
                                      @RequestParam Integer sage,
                                      @RequestParam String ssex){
        student student=new student();
        student.setSid(sid);
        student.setSname(sname);
        student.setSsex(ssex);
        student.setSage(sage);
        studentService.updateStudent(student);
        return new ModelAndView("success");
    }

    @RequestMapping(value = "/updateTeacher3",method = RequestMethod.POST)
    public ModelAndView updateTeacher3(@RequestParam Integer tid,
                                       @RequestParam String tname){
        teacher teacher=new teacher();
        teacher.setTid(tid);
        teacher.setTname(tname);
        studentService.updateTeacher(teacher);
        return new ModelAndView("success");
    }

}

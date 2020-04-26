package com.great.talent.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.google.gson.Gson;
import com.great.alipay.config.AlipayConfig;
import com.great.talent.aoplog.Log;
import com.great.talent.entity.*;
import com.great.talent.service.AdminService;
import com.great.talent.service.EnterpriseService;
import com.great.talent.service.SchoolService;
import com.great.talent.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Encoder;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/Enterprise")
public class EnterpriseController {

    private Random random = new Random();
    private Diagis diagis = new Diagis();
    private  ModelAndView mv = new ModelAndView();
    @Resource
    private EnterpriseService enterpriseService;
    @Resource
    private AdminService adminService;
    @Resource
    private SchoolService schoolService;

    /**
     * 企业路径跳转
     *
     * @param url
     * @return
     */
    @RequestMapping("/path/{url}")
    public String Welcome(@PathVariable("url") String url) {
        return "Enterprise/" + url;
    }

    /**
     * 验证码
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/CodeServlet")
    public void CheckCodeServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //内存图片对象(TYPE_INT_BGR 选择图片模式RGB模式)
        BufferedImage image = new BufferedImage(100, 35, BufferedImage.TYPE_INT_BGR);
        //得到画笔
        Graphics graphics = image.getGraphics();
        //画之前要设置颜色，设置画笔颜色
        graphics.setColor(new Color(236, 255, 253, 255));
        //设置字体类型、字体大小、字体样式　
        graphics.setFont(new Font("黑体", Font.BOLD, 23));
        //填充矩形区域（指定要画的区域设置区）
        graphics.fillRect(0, 0, 100, 35);
        //为了防止黑客软件通过扫描软件识别验证码。要在验证码图片上加干扰线
        //给两个点连一条线graphics.drawLine();
        for (int i = 0; i < 5; i++) {
            //颜色也要随机（设置每条线随机颜色）
            graphics.setColor(getRandomColor());
            int x1 = random.nextInt(100);
            int y1 = random.nextInt(35);
            int x2 = random.nextInt(100);
            int y2 = random.nextInt(35);
            graphics.drawLine(x1, y1, x2, y2);
        }
        //拼接4个验证码，画到图片上
        char[] arrays = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            //设置字符的颜色
            int index = random.nextInt(arrays.length);
            builder.append(arrays[index]);
        }
        //创建session对象将生成的验证码字符串以名字为checkCode保存在session中request.getSession().setAttribute("checkCode",builder.toString());
        //将4个字符画到图片上graphics.drawString(str ,x,y);一个字符一个字符画
        request.getSession().setAttribute("vcode", builder.toString());
        for (int i = 0; i < builder.toString().length(); i++) {
            graphics.setColor(getRandomColor());
            char item = builder.toString().charAt(i);
            graphics.drawString(item + "", 10 + (i * 20), 25);
        }
        //输出内存图片到输出流
        ImageIO.write(image, "jpg", response.getOutputStream());
    }

    private Color getRandomColor() {
        int r = random.nextInt(256);
        int g = random.nextInt(256);
        int b = random.nextInt(256);
        return new Color(r, g, b);
    }

    /**
     * 管理员、高校、企业登录
     *
     * @param admin
     * @param session
     * @return
     */
    @RequestMapping("/adminLogin")
    @ResponseBody
    public String adminLogin(Admin admin, HttpSession session) {
        String sessionCode = (String) session.getAttribute("vcode");
        System.out.println(sessionCode);
        System.out.println(admin.toString());
        if (!admin.getCode().equalsIgnoreCase(sessionCode)) {
            return "noCode";
        }
        Admin admins = enterpriseService.adminLogin(admin.getAccount());
        if (null == admins) {
            return "noAccount";
        }
        if (!MD5Utils.checkpassword(admin.getPassword(), admins.getPassword())) {
            return "error";
        }
        if (admins.getState() == "禁用") {
            return "forbidden";
        } else if (admins.getState() == "删除") {
            return "delete";
        }
        session.setAttribute("admin", admins);
        List<RoleMenu> list=adminService.selectRoleMenu(admins.getRole().getRoleid()+"");
        System.out.println(list);
        session.setAttribute("menuMap",list);
        return "success";
    }

    //根据用户名查用户手机号
    @RequestMapping("/findPhoneByAccount")
    @ResponseBody
    public void findPhoneByAccount(HttpServletRequest request, HttpServletResponse response)throws IOException{
        String account = request.getParameter("account");
        String test = request.getParameter("test");
        String sessionCode = (String)request.getSession().getAttribute("vcode");
        if (sessionCode.equalsIgnoreCase(test)){
            Admin admins = enterpriseService.adminLogin(account);
            String tel = admins.getTel();
            if (null!=tel){
                response.getWriter().print("1111");
                request.getSession().setAttribute("retrieveName",account);
                request.getSession().setAttribute("retrievePhone",tel);
            }else {
                response.getWriter().print("error");
            }
        }else {
            response.getWriter().print("testError");
        }
    }

    /**
     * 获取短信验证码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/sendMsg")
    @ResponseBody
    public void sendMsg(HttpServletRequest request, HttpServletResponse response)throws IOException{
        String phone = request.getParameter("tel"); //发送短信验证码
        PhoneCode.getPhonemsg(phone);
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print(PhoneCode.code);
    }

    /**
     * 找回-新密码修改
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public void updatePwd(HttpServletRequest request, HttpServletResponse response)throws IOException{
        String uaccount = request.getParameter("retrieveName");
        String upassword = MD5Utils.md5(request.getParameter("newPwd"));
        Admin admin = new Admin();
        admin.setPassword(upassword);
        admin.setAccount(uaccount);
        int flag = enterpriseService.updateAdmin(admin);
        if (flag>0){
            response.getWriter().print("1111");
        }else {
            response.getWriter().print("error");
        }
    }
    /**
     * 退出
     * @param httpSession
     * @return
     */
    @RequestMapping("/Exit")
    public ModelAndView Exit(HttpSession httpSession){
        httpSession.invalidate();
        mv.setViewName("homepage/index");
        return mv;
    }
    /**
     * 查重账号
     *
     * @param admin
     * @param response
     * @throws IOException
     */
    @RequestMapping("/doAccount")
    @ResponseBody
    public void doAccount(Admin admin, HttpServletResponse response) throws IOException {
        if (enterpriseService.adminLogin(admin.getAccount()) != null) {
            response.getWriter().print("error");
        } else {
            response.getWriter().print("success");
        }
    }

    /**
     * 查重手机
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/checkAdminTel")
    @ResponseBody
    public void checkAdminTel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String tel = request.getParameter("phone");
        System.out.println(tel);
        if (enterpriseService.checkAdminTel(tel) != null) {
            response.getWriter().print("noPhone");
        } else {
            response.getWriter().print("phone");
        }
    }

    /**
     * 注册用户和简易注册公司
     *
     * @param admin
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/RegisterAdmin")
    @ResponseBody
    public void RegisterAdmin(Admin admin, HttpServletRequest request, HttpServletResponse response) throws IOException {
        admin.setRoleid(2);
        admin.setState("禁用");
        admin.setDate(new Date());
        admin.setMoney(0);
        String pwd = MD5Utils.md5(admin.getPassword());
        String payment = MD5Utils.md5(admin.getPayment());
        admin.setPassword(pwd);
        admin.setPayment(payment);
        Company company = new Company();
        company.setCompanyname(admin.getCompanyname());
        company.setPermit(admin.getPermit());
        String sessionCode = (String) request.getSession().getAttribute("vcode");
        String regCode = request.getParameter("code");
        System.out.println("sessionCode=" + sessionCode + "regCode=" + regCode);
        if (regCode.equalsIgnoreCase(sessionCode)) {
            if (enterpriseService.addCompany(company) != 0) {
                admin.setCid(company.getCid());
                enterpriseService.addAdmin(admin);
                response.getWriter().print("success");
            } else {
                response.getWriter().print("error");
            }
        } else {
            response.getWriter().print("noCode");
        }
    }

    /**
     * 对公司的岗位进行初始化处理
     * @param request
     */
    @RequestMapping("/Initialize")
    public void Initialize(HttpServletRequest request){
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        List<Position> positionList = enterpriseService.findMaxPosition(admin.getAid());
        if (positionList !=null){
            for (int i =0;i<positionList.size();i++){
                enterpriseService.Initialize(positionList.get(i).getPositionid());
            }
        }
    }

    /**
     * 查询下拉框的信息,并跳转查询岗位的页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/findPositionInfo")
    public ModelAndView findPositionInfo(HttpServletRequest request) {
        Map map = enterpriseService.findPositionInfo();
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String companyName = enterpriseService.findCompanyName(admin.getAid());
        String companyAdd = enterpriseService.findCompanyAdd(admin.getCid());
        List<Degree> degree = (List<Degree>) map.get("degreeList");
        List<Degree> industry = (List<Degree>) map.get("industryList");
        List<Degree> profession = (List<Degree>) map.get("professionList");
        request.getSession().setAttribute("degree", degree);
        request.getSession().setAttribute("industry", industry);
        request.getSession().setAttribute("profession", profession);
        request.getSession().setAttribute("companyName", companyName);
        request.getSession().setAttribute("companyAdd", companyAdd);
        mv.setViewName("/Enterprise/PostManager");
        return mv;
    }

    /**
     * 通过行业查询岗位
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findPostInfo")
    @ResponseBody
    public void findPostInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String industryid = request.getParameter("industryid");
        Gson gson = new Gson();
        List<Post> plist = enterpriseService.findPostName(Integer.valueOf(industryid));
        System.out.println(plist);
        String msg = gson.toJson(plist);
        if (null != msg && "" != msg) {
            ResponseUtils.outJson1(response, msg);
        } else {
            response.getWriter().print("error");
        }
    }

    /**
     * 查询发布岗位信息
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findPositions")
    @ResponseBody
    public void findPositions(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        String industryid = request.getParameter("industryid");
        String positionname = request.getParameter("positionname");
        String degreeid = request.getParameter("degreeid");
        String professid = request.getParameter("professid");
        System.out.println("industryid="+industryid+"positionname="+positionname+"degreeid="+degreeid+"professid="+professid);
        int pageInt = Integer.valueOf(page);
        int limitInt = Integer.parseInt(limit);
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        HashMap<String, Object> condition = new HashMap<>();
        if (null != industryid && !"".equals((industryid.trim())) && !"0".equals(industryid.trim())) {
            condition.put("industryid", industryid);
        }
        if (null != positionname && !"".equals((positionname.trim()))) {
            condition.put("positionname", positionname);
        }
        if (null != degreeid && !"".equals((degreeid.trim())) && !"0".equals(degreeid.trim())) {
            condition.put("degreeid", degreeid);
        }
        if (null != professid && !"".equals((professid.trim())) && !"0".equals(professid.trim())) {
            condition.put("professid", professid);
        }
        int pageInts = (pageInt - 1) * limitInt;
        condition.put("pageInts", pageInts);
        condition.put("limitInt", limitInt);
        condition.put("aid",admin.getAid());
        Map map = enterpriseService.findPositions(condition);
        if (map.size() != 0) {
            diagis.setCode(0);
            diagis.setMsg("");
            diagis.setCount((Integer) map.get("count"));
            diagis.setData((List<Position>) map.get("positionList"));
            ResponseUtils.outJson(response, diagis);
        }
    }

    /**
     * 发布岗位记录
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/addPositionInfo")
    @ResponseBody
    @Log(operationType="发布岗位")
    public void addPositionInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int flag = 0;
        String jsonstr = request.getParameter("postInfo");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String[] params = request.getParameterValues("welname");
        Gson gson = new Gson();
        Position position = gson.fromJson(jsonstr, Position.class);
        Date positiontime = new Date();
        position.setPositiontime(positiontime);
        position.setAid(admin.getAid());
        System.out.println(position.toString());
        int flags = enterpriseService.addPositionInfo(position);
        System.out.println(flags);
        if (flags != 0) {
            for (int i = 0; i < params.length; i++) {
                String welname = params[i];
                System.out.println(welname);
                Map map = new HashMap();
                map.put("positionid", position.getPositionid());
                map.put("welname", welname);
                flag = enterpriseService.addWelfare(map);
            }
        }
        if (flag > 0) {
            response.getWriter().print(1111);
        } else {
            response.getWriter().print(2222);
        }
    }

    /**
     * 查询福利
     * @param request
     * @return
     */
    @RequestMapping("/findWelfName")
    @ResponseBody
    public List<Position> findWelfName(HttpServletRequest request) {
        String positionid = request.getParameter("positionid");
        List<Position> positionList = enterpriseService.findWelfName(Integer.valueOf(positionid));
//        System.out.println(positionList);
        return positionList;
    }

    /**
     * 修改发布岗位记录的状态
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/updatePositionState")
    @ResponseBody
    public void updatePositionState(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int flags = 0;
        String jsonStr = request.getParameter("postInfo");
        Gson gson = new Gson();
        Position position = gson.fromJson(jsonStr, Position.class);
        System.out.println(position.toString());
        String[] params = request.getParameterValues("welname");
        int flag = enterpriseService.updatePositionState(position);
        if (flag > 0) {
            for (int i = 0; i < params.length; i++) {
                String welname = params[i];
                Map map = new HashMap();
                map.put("positionid", position.getPositionid());
                map.put("welname", welname);
                flags = enterpriseService.deleteWelfare(map);
                enterpriseService.addWelfare(map);
            }
        }
        if (flags > 0) {
            response.getWriter().print(1111);
        } else {
            response.getWriter().print(2222);
        }
    }

    /**
     * 查询公司信息
     * @param session
     * @return
     */
    @RequestMapping("/findCompanyInfo")
    public ModelAndView findCompanyInfo(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Admin admin = (Admin) session.getAttribute("admin");
        Company company = enterpriseService.findCompanyInfo(admin.getAid());
//        System.out.println(company.toString());
        session.setAttribute("company", company);
        mv.setViewName("/Enterprise/PerfectInfo");
        return mv;
    }

    /**
     * 充值页
     * @param session
     * @return
     */
    @RequestMapping("/CompanyRecharge")
    public ModelAndView CompanyRecharge(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Admin admin = (Admin) session.getAttribute("admin");
        Company company = enterpriseService.findCompanyInfo(admin.getAid());
//        System.out.println(company.toString());
        session.setAttribute("company", company);
        mv.setViewName("/Enterprise/Recharge");
        return mv;
    }
    /**
     * 图片上传
     * @param file
     * @param company
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/uplodFile")
    @ResponseBody
    public String uplodFile(MultipartFile file, Company company, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (file.getOriginalFilename()!=null&&!"".equals(file.getOriginalFilename().trim())) {
            Admin admin = (Admin) request.getSession().getAttribute("admin");
            company.setCid(admin.getCid());
            String filename = file.getOriginalFilename();
            String savePath = request.getSession().getServletContext().getRealPath("/images");
            String projectPath = savePath + "/" + filename;
            if (file.getOriginalFilename().split("\\.")[1].equals("png")
                    || file.getOriginalFilename().split("\\.")[1].equals("jpg")
                    || file.getOriginalFilename().split("\\.")[1].equals("jpeg")) {
                file.transferTo(new File(projectPath));
                company.setCompanypic("images/" + file.getOriginalFilename());
                System.out.println(company.toString());
                int flag = enterpriseService.updateCompanyInfo(company);
                if (flag > 0) {
                    return "{\"code\":0, \"msg\":\"\", \"data\":{}}";
                }
            } else {
                return "{\"code\":1, \"msg\":\"\", \"data\":{}}";
            }
        }
        return "{\"code\":2, \"msg\":\"\", \"data\":{}}";
    }

    /**
     * 查询下拉框的信息,并跳转查询求职的页面
     * @param request
     * @return
     */
    @RequestMapping("/findInterviewInfo")
    public ModelAndView findInterviewInfo(HttpServletRequest request) {
        Map map = enterpriseService.findPositionInfo();
        List<Degree> industry = (List<Degree>) map.get("industryList");
        request.getSession().setAttribute("industry", industry);
        mv.setViewName("/Enterprise/JobManager");
        return mv;
    }

    /**
     * 查询面试信息
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findInterviews")
    @ResponseBody
    public void findInterviews(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        String industryid = request.getParameter("industryid");
        String positionname = request.getParameter("positionname");
//        System.out.println("industryid="+industryid+"positionname="+positionname);
        int pageInt = Integer.valueOf(page);
        int limitInt = Integer.parseInt(limit);
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        HashMap<String, Object> condition = new HashMap<>();
        if (null != industryid && !"".equals((industryid.trim())) && !"0".equals(industryid.trim())) {
            condition.put("industryid", industryid);
        }
        if (null != positionname && !"".equals((positionname.trim()))) {
            condition.put("positionname", positionname);
        }
        int pageInts = (pageInt - 1) * limitInt;
        condition.put("pageInts", pageInts);
        condition.put("limitInt", limitInt);
        condition.put("aid",admin.getAid());
        Map map = enterpriseService.findInterview(condition);
//        System.out.println(map);
//        System.out.println(map.get("interviewList"));
        if (map.size() != 0) {
            diagis.setCode(0);
            diagis.setMsg("");
            diagis.setCount((Integer) map.get("count"));
            diagis.setData((List<Interview>) map.get("interviewList"));
            ResponseUtils.outJson(response, diagis);
        }
    }

    /**
     * 邀请面试
     * @param interview
     * @return
     */
    @RequestMapping("/updateInterInvate")
    @ResponseBody
    public String updateInterInvate(Interview interview){
//          interview.setInvate("邀请");
          interview.setEndtime(new Date());
          int flag = enterpriseService.updateInterInvate(interview);
          if (flag>0){
              return "success";
          }else{
              return "error";
          }
    }

    /**
     * 查询求职进度
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findFeedbackInfo")
    @ResponseBody
    public void findFeedbackInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        String check = request.getParameter("check");
        String invate = request.getParameter("invate");
        String interstate = request.getParameter("interstate");
        String employ = request.getParameter("employ");
//        System.out.println("industryid="+industryid+"positionname="+positionname);
        int pageInt = Integer.valueOf(page);
        int limitInt = Integer.parseInt(limit);
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        HashMap<String, Object> condition = new HashMap<>();
        if (null != check && !"".equals((check.trim())) && !"0".equals(check.trim())) {
            condition.put("check", check);
        }
        if (null != employ && !"".equals((employ.trim()))) {
            condition.put("employ", employ);
        }
        if (null != invate && !"".equals((invate.trim()))) {
            condition.put("invate", invate);
        }
        if (null != interstate && !"".equals((interstate.trim()))) {
            condition.put("interstate", interstate);
        }
        int pageInts = (pageInt - 1) * limitInt;
        condition.put("pageInts", pageInts);
        condition.put("limitInt", limitInt);
        condition.put("aid",admin.getAid());
        Map map = enterpriseService.findFeedbackInfo(condition);
        System.out.println(map);
        System.out.println(map.get("flist"));
        if (map.size() != 0) {
            diagis.setCode(0);
            diagis.setMsg("");
            diagis.setCount((Integer) map.get("count"));
            diagis.setData((List<Interview>) map.get("flist"));
            ResponseUtils.outJson(response, diagis);
        }
    }

    /**
     * 公司录用
     * @param interview
     * @return
     */
    @RequestMapping("/companyEmploy")
    @ResponseBody
    public String companyEmploy(Interview interview){
        interview.setEndtime(new Date());
        int flags = enterpriseService.JudgecompanyEmploy(interview);
        if (flags>0) {
            int uid = enterpriseService.companyEmploy(interview);
            int flag = enterpriseService.updateResumeInfo(uid);
            if (flag > 0) {
                enterpriseService.updateApplicantsNum(interview.getPositionid());
                return "success";
            } else {
                return "error";
            }
        }else{
            return "NumError";
        }
    }

    /**
     * 查询录用人员信息
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findCompanyEmployInfo")
    @ResponseBody
    public void findCompanyEmployInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
//        System.out.println("industryid="+industryid+"positionname="+positionname);
        int pageInt = Integer.valueOf(page);
        int limitInt = Integer.parseInt(limit);
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        HashMap<String, Object> condition = new HashMap<>();
        int pageInts = (pageInt - 1) * limitInt;
        condition.put("pageInts", pageInts);
        condition.put("limitInt", limitInt);
        condition.put("aid",admin.getAid());
        Map map = enterpriseService.findCompanyEmployInfo(condition);
        if (map.size() != 0) {
            diagis.setCode(0);
            diagis.setMsg("");
            diagis.setCount((Integer) map.get("count"));
            diagis.setData((List<Interview>) map.get("employList"));
            ResponseUtils.outJson(response, diagis);
        }
    }
    /**
     * 周半年统计(求职)
     * @param session
     * @return
     */
    @RequestMapping("/weekJobInfo")
    @ResponseBody
    public String weekJobInfo(HttpSession session)
    {
        Admin admin = (Admin) session.getAttribute("admin");
        Company company = enterpriseService.findCompanyInfo(admin.getAid());
        int companyid = company.getCid();
        ArrayList<CensusUtil> arrayList = new ArrayList<>();
        List<String> dateWeekList = UtilTool.week(new Date());
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        int sum = 0;

        for (int i = 0; i < dateWeekList.size(); i++)
        {
            int count = enterpriseService.weekJobinfo(dateWeekList.get(i), companyid);
            CensusUtil censusUtil = new CensusUtil();
            censusUtil.setCount(count);
            censusUtil.setName(weekDays[i]);
            arrayList.add(censusUtil);
            sum = count + sum;
        }

        Gson gson = new Gson();
        String jsonStr = gson.toJson(arrayList);
        String msg = jsonStr + "://" + sum;
        return msg;
    }

    /**
     * 月统计(求职)
     * @param date
     * @param session
     * @return
     */
    @RequestMapping("/monthJobInfo")
    @ResponseBody
    public String monthJobInfo(String date, HttpSession session)
    {
        Admin admin = (Admin) session.getAttribute("admin");
        Company company = enterpriseService.findCompanyInfo(admin.getAid());
        int companyid = company.getCid();
        ArrayList<CensusUtil> arrayList = new ArrayList<>();
        List<String> dateHalfList = null;
        dateHalfList = UtilTool.month(date);

        int sum = 0;
        for (int i = 0; i < dateHalfList.size(); i++)
        {
            String[] time = dateHalfList.get(i).split(" ");
            int count = enterpriseService.monthJobinfo(time[0], time[1] + " 23:59:59", companyid);
            CensusUtil censusUtil = new CensusUtil();
            censusUtil.setCount(count);
            censusUtil.setName("第" + (i + 1) + "周");
            arrayList.add(censusUtil);

            sum = count + sum;
        }
        Gson gson = new Gson();
        String jsonStr = gson.toJson(arrayList);
        String msg = jsonStr + "://" + sum;
        return msg;
    }

    /**
     * 进半年统计(求职)
     * @param date
     * @param session
     * @return
     * @throws ParseException
     */
    @RequestMapping("/halfJobInfo")
    @ResponseBody
    public String halfJobInfo(String date, HttpSession session)throws ParseException {
        Admin admin = (Admin) session.getAttribute("admin");
        Company company = enterpriseService.findCompanyInfo(admin.getAid());
        int companyid = company.getCid();
        ArrayList<CensusUtil> arrayList = new ArrayList<>();
        List<String> dateHalfList = null;
        dateHalfList = UtilTool.half();
        int sum = 0;
        for (int i = 0; i < dateHalfList.size(); i++)
        {
            int count = enterpriseService.weekJobinfo(dateHalfList.get(i), companyid);
            CensusUtil censusUtil = new CensusUtil();
            censusUtil.setCount(count);
            censusUtil.setName(dateHalfList.get(i));
            arrayList.add(censusUtil);
            sum = count + sum;
        }
        Gson gson = new Gson();
        String jsonStr = gson.toJson(arrayList);

        String msg = jsonStr + "://" + sum;
        return msg;
    }

    /**
     * 查询下拉框的信息,并跳转查询岗位的页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/findScreenInfo")
    public ModelAndView findScreenInfo(HttpServletRequest request) {
        Map map = enterpriseService.findScreenInfo();
        List<SchoolMsg> schoolMsgList = (List<SchoolMsg>) map.get("schoolMsgList");
        List<Profession> professionList = (List<Profession>) map.get("professionList");
        request.getSession().setAttribute("schoolMsgList", schoolMsgList);
        request.getSession().setAttribute("professionList", professionList);
        mv.setViewName("/Enterprise/ScreenResume");
        return mv;
    }

    /**
     * 查询发布岗位信息
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findScreenResumeInfo")
    @ResponseBody
    public void findScreenResumeInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        String sid = request.getParameter("sid");
        String professid = request.getParameter("professid");
        System.out.println("sid="+sid+"professid="+professid);
        int pageInt = Integer.valueOf(page);
        int limitInt = Integer.parseInt(limit);
//        Admin admin = (Admin) request.getSession().getAttribute("admin");
        HashMap<String, Object> condition = new HashMap<>();
        if (null != sid && !"".equals((sid.trim())) && !"0".equals(sid.trim())) {
            condition.put("sid", sid);
        }
        if (null != professid && !"".equals((professid.trim())) && !"0".equals(professid.trim())) {
            condition.put("professid", professid);
        }
        int pageInts = (pageInt - 1) * limitInt;
        condition.put("pageInts", pageInts);
        condition.put("limitInt", limitInt);
        Map map = enterpriseService.findScreenResumeInfo(condition);
        if (map.size() != 0) {
            diagis.setCode(0);
            diagis.setMsg("");
            diagis.setCount((Integer) map.get("count"));
            diagis.setData((List<Resume>) map.get("screenList"));
            ResponseUtils.outJson(response, diagis);
        }
    }

    /**
     * 查询岗位名称
     * @param request
     * @return
     */
    @RequestMapping("/findPositionName")
    public ModelAndView findPositionName(HttpServletRequest request){
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        List<Position> positionList = enterpriseService.findPositionName(admin.getAid());
        mv.addObject("positionList",positionList);
        mv.setViewName("Enterprise/CompanyInvitation");
        return mv;
    }
    /**
     * 筛选简历公司邀请面试
     * @param interview
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/addInterviews")
    @ResponseBody
    public void addInterviews(Interview interview,HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (interview != null){
            interview.setIntertime(new Date());
            interview.setCheck("已查看");
            interview.setInvate("已邀请");
            int flag = enterpriseService.addInterViews(interview);
            if (flag > 0){
                response.getWriter().print("success");
            }
        }else{
            response.getWriter().print("error");
        }
    }

    /**
     * 充值添加订单
     * @param finance
     * @return
     * @throws AlipayApiException
     */
    @RequestMapping("/addFinances")
    @ResponseBody
    public String addFinances(Finance finance) throws AlipayApiException {
        System.out.println(finance.toString());
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填WIDout_trade_norequest.getParameter("12").getBytes("ISO-8859-1"),"UTF-8"
        String out_trade_no = new String(String.valueOf(finance.getTradeno()));
        //付款金额，必填WIDtotal_amount
        String total_amount = new String(String.valueOf(finance.getPrice()));
        //订单名称，必填WIDsubject
        String subject = new String(finance.getCompanyname()+"充值");
        //商品描述，可空WIDbody
        String body = new String("充值");
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return  result;

    }

    /**
     * 支付宝同步回调方法
     * @param request
     * @param out_trade_no
     * @param total_amount
     * @return
     */
    @RequestMapping("/paymentUrl")
    public ModelAndView returnUrl(HttpServletRequest request,String out_trade_no,String total_amount){
        System.out.println("同步通知支付成功");
        Finance finance = new Finance();
        Company company = (Company) request.getSession().getAttribute("company");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        finance.setCid(company.getCid());
        finance.setCompanyname(company.getCompanyname());
        finance.setFinancetype("充值");
        finance.setFinancetime(new Date());
        finance.setTradeno(out_trade_no);
        finance.setPrice(Double.valueOf(total_amount).intValue());
        finance.setFinancestate("正常");
        System.out.println(finance.toString());
        int flag = enterpriseService.addFinances(finance);
        Map map = new HashMap();
        map.put("money",Double.valueOf(total_amount).intValue());
        map.put("aid",admin.getAid());
        if (flag>0){
            enterpriseService.EnterpriseRecharge(map);
            mv.setViewName("/Enterprise/Transition");
        }else{
            mv.setViewName("/Enterprise/Error");
        }
        return mv;
    }

    /**
     * 支付宝异步回调
     * @param request
     * @param out_trade_no
     * @param total_amount
     * @return
     */
    @RequestMapping("/paymentUrls")
    public ModelAndView paymentUrlS(HttpServletRequest request,String out_trade_no,String total_amount){
        ModelAndView mv = new ModelAndView();
        System.out.println("异步通知支付成功");
        Finance finance = new Finance();
        Company company = (Company) request.getSession().getAttribute("company");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        finance.setCid(company.getCid());
        finance.setCompanyname(company.getCompanyname());
        finance.setFinancetype("充值");
        finance.setFinancetime(new Date());
        finance.setTradeno(out_trade_no);
        finance.setPrice(Double.valueOf(total_amount).intValue());
        finance.setFinancestate("正常");
        System.out.println(finance.toString());
        int flag = enterpriseService.addFinances(finance);
        Map map = new HashMap();
        map.put("money",Double.valueOf(total_amount).intValue());
        map.put("aid",admin.getAid());
        if (flag>0){
            enterpriseService.EnterpriseRecharge(map);
            mv.setViewName("/Enterprise/Transition");
        }else{
            mv.setViewName("/Enterprise/Error");
        }
        return mv;
    }

    /**
     * 跳转订单页面
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/findAdminMoney")
    public ModelAndView findAdminMoney(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        Admin admins = enterpriseService.adminLogin(admin.getAccount());
        mv.addObject("money",admins.getMoney());
        mv.setViewName("/Enterprise/EnterpriseFinance");
        return mv;
    }


    /**
     * 查询订单信息
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findFinances")
    @ResponseBody
    public void findFinances(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        String tradeno = request.getParameter("tradeno");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        int pageInt = Integer.valueOf(page);
        int limitInt = Integer.parseInt(limit);
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        Company company = enterpriseService.findCompanyInfo(admin.getAid());
        HashMap<String, Object> condition = new HashMap<>();
        if (null != tradeno && !"".equals((tradeno.trim())) && !"0".equals(tradeno.trim())) {
            condition.put("tradeno", tradeno);
        }
        if (null != startTime && !"".equals((startTime.trim()))) {
            condition.put("startTime", startTime);
        }
        if (null != endTime && !"".equals((endTime.trim()))) {
            condition.put("endTime", endTime);
        }
        int pageInts = (pageInt - 1) * limitInt;
        condition.put("pageInts", pageInts);
        condition.put("limitInt", limitInt);
        condition.put("cid",company.getCid());
        Map map = enterpriseService.findFinances(condition);
        System.out.println(map.get("financeList"));
        if (map.size() != 0) {
            diagis.setCode(0);
            diagis.setMsg("");
            diagis.setCount((Integer) map.get("count"));
            diagis.setData((List<Finance>) map.get("financeList"));
            ResponseUtils.outJson(response, diagis);
        }
    }

    /**
     * 判断简历是否被付费过
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/JudgeResume")
    @ResponseBody
    public void JudgeResume(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String resumeid = request.getParameter("resumeid");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        Map map = new HashMap();
        map.put("cid",admin.getCid());
        map.put("resumeid",resumeid);
        int count = enterpriseService.findFinanceInterview(map);
        if (count != 0){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }

    /**
     * 购买简历时，验证密码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/JudgePassword")
    @ResponseBody
    public void JudgePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String payment = request.getParameter("payment");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (MD5Utils.checkpassword(payment,admin.getPayment())){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }

    }
    /**
     * 购买简历
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/purchaseResume")
    @ResponseBody
    public void purchaseResume(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String resumeid = request.getParameter("resumeid");
        String tradeno = request.getParameter("tradeno");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        Company company = enterpriseService.findCompanyInfo(admin.getAid());
        Finance finances = new Finance();
        int prices = enterpriseService.findPrice();
        finances.setPrice(prices);
        finances.setFinancetype("支出");
        finances.setFinancestate("正常");
        finances.setFinancetime(new Date());
        finances.setTradeno(tradeno);
        finances.setResumeid(Integer.parseInt(resumeid));
        finances.setCid(company.getCid());
        finances.setCompanyname(company.getCompanyname());
        if (admin.getMoney()>=10){
            int flag = enterpriseService.purchaseResume(finances);
            if(flag > 0){
                admin.setMoney(10);
                enterpriseService.reduceCompanyMoney(admin);
                response.getWriter().print("success");
            }else{
                response.getWriter().print("error");
            }
        }else{
            response.getWriter().print("deficiency");
        }
    }

    /**
     * 查询用户简历
     * @param request
     * @param response
     */
    @RequestMapping("/findResume")
    public void findResume(HttpServletRequest request, HttpServletResponse response){
        String jsonStr=request.getParameter("uid");
        Gson g=new Gson();
        UserTalent userTalent=g.fromJson(jsonStr,UserTalent.class);
        Resume resume=schoolService.findUserResume(userTalent);
        List<Social> socials=schoolService.findUserSocial(userTalent);
        List<Aducational> aducationals=schoolService.findUserAducation(userTalent);
        System.out.println(resume+"="+socials+"-"+aducationals);
        ResponseUtils.outJson1(response,g.toJson(resume)+"%"+g.toJson(socials)+"%"+g.toJson(aducationals));

    }

    /**
     * 导出简历
     * @param request
     * @param response
     * @throws ParseException
     */
    @RequestMapping("/outputTalent")
    @ResponseBody
    public void  outputTalent(HttpServletRequest request,HttpServletResponse response) throws ParseException{
        String imagePath=request.getServletContext().getRealPath("/images");
        HashMap<String, Object> condition = new HashMap<>();
        String uid = request.getParameter("uid");
        String operationtime = request.getParameter("operationtime");
        condition.put("uid", uid);
        condition.put("operationtime",operationtime);
        //查询简历信息然后循环遍历
        Resume resumes=enterpriseService.outPutUserResume(condition);
            List<Social> socials = schoolService.outPutUserSocial(resumes);
            List<Aducational> aducationals = schoolService.outPutUserAducation(resumes);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("resume", resumes);
            map.put("socials", socials);
            map.put("aducations",aducationals);
            System.out.println(imagePath+"\\"+resumes.getRepic().split("/")[1]);
            map.put("repic",this.getImageBase(imagePath+"\\"+resumes.getRepic().split("/")[1]));
            try {
                WordUtil.exportMillCertificateWord(request, response, map, "简历", "template.ftl");
            } catch (IOException e) {

                e.printStackTrace();
            }
    }
    @SuppressWarnings("deprecation")
    public String getImageBase(String src) {
        if(src==null||src==""){
            return "";
        }
        File file = new File(src);
        if(!file.exists()) {
            return "";
        }
        InputStream in = null;
        byte[] data = null;
        try {
            in = new FileInputStream(file);
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
        try {
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        BASE64Encoder encoder = new BASE64Encoder();

        return encoder.encode(data);
    }
}

package com.great.talent.controller;

import com.great.talent.entity.Admin;
import com.great.talent.entity.Degree;
import com.great.talent.entity.Position;
import com.great.talent.service.EnterpriseService;
import com.great.talent.util.Diagis;
import com.great.talent.util.MD5Utils;
import com.great.talent.util.ResponseUtils;
import com.sun.org.apache.bcel.internal.generic.GETSTATIC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/Enterprise")
public class EnterpriseController {

    private Random random = new Random();
    private Diagis diagis = new Diagis();
    @Autowired
    private EnterpriseService enterpriseService;

    /**
     * 企业路径跳转
     * @param url
     * @return
     */
    @RequestMapping("/path/{url}")
    public String Welcome(@PathVariable("url")String url){
        return "Enterprise/"+url;
    }
    /**
     * 验证码
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
        graphics.setColor(new Color(236,255,253,255));
        //设置字体类型、字体大小、字体样式　
        graphics.setFont(new Font("黑体", Font.BOLD, 23));
        //填充矩形区域（指定要画的区域设置区）
        graphics.fillRect(0, 0, 100, 35);
        //为了防止黑客软件通过扫描软件识别验证码。要在验证码图片上加干扰线
        //给两个点连一条线graphics.drawLine();
        for (int i = 0; i < 5; i++)
        {
            //颜色也要随机（设置每条线随机颜色）
            graphics.setColor(getRandomColor());
            int x1 = random.nextInt(100);
            int y1 = random.nextInt(35);
            int x2 = random.nextInt(100);
            int y2 = random.nextInt(35);
            graphics.drawLine(x1, y1, x2, y2);
        }
        //拼接4个验证码，画到图片上
        char[] arrays = {'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','W','X','Y','Z','1','2','3','4','5','6','7','8','9'};
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < 4; i++)
        {
            //设置字符的颜色
            int index = random.nextInt(arrays.length);
            builder.append(arrays[index]);
        }
        //创建session对象将生成的验证码字符串以名字为checkCode保存在session中request.getSession().setAttribute("checkCode",builder.toString());
        //将4个字符画到图片上graphics.drawString(str ,x,y);一个字符一个字符画
        request.getSession().setAttribute("vcode",builder.toString());
        for (int i = 0; i < builder.toString().length(); i++)
        {
            graphics.setColor(getRandomColor());
            char item = builder.toString().charAt(i);
            graphics.drawString(item + "", 10 + (i * 20), 25);
        }
        //输出内存图片到输出流
        ImageIO.write(image, "jpg", response.getOutputStream());
    }
    private Color getRandomColor()
    {
        int r = random.nextInt(256);
        int g = random.nextInt(256);
        int b = random.nextInt(256);
        return new Color(r, g, b);
    }
    /**
     * 管理员、高校、企业登录
     * @param admin
     * @param session
     * @return
     */
    @RequestMapping("/adminLogin")
    @ResponseBody
    public String adminLogin(Admin admin, HttpSession session){
        String sessionCode = (String) session.getAttribute("vcode");
        if (!admin.getCode().equalsIgnoreCase(sessionCode)){
            return "noCode";
        }
        Admin admins = enterpriseService.adminLogin(admin.getAccount());
        if (null == admins){
            return "noAccount";
        }
        if (!MD5Utils.checkpassword(admin.getPassword(),admins.getPassword())){
            return "error";
        }
        if (admins.getState() == "禁用"){
            return "forbidden";
        }else if (admins.getState() == "删除"){
            return "delete";
        }

        session.setAttribute("admin",admins);
        return "success";
    }
    @RequestMapping("/findPositionInfo")
    public ModelAndView findPositionInfo(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        Map map = enterpriseService.findPositionInfo();
        List<Degree> degree = (List<Degree>) map.get("degreeList");
        List<Degree> industry = (List<Degree>) map.get("industryList");
        List<Degree> profession = (List<Degree>) map.get("professionList");
        request.setAttribute("degree",degree);
        request.setAttribute("industry",industry);
        request.setAttribute("profession",profession);
        mv.setViewName("/Enterprise/PostManager");
        return mv;
    }

    /**
     * 查询发布岗位信息
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/findPositions")
    @ResponseBody
    public void findPositions(HttpServletRequest request, HttpServletResponse response)throws IOException{
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        String industryid = request.getParameter("industryid");
        String positionname = request.getParameter("positionname");
        String degreeid = request.getParameter("degreeid");
        String professid = request.getParameter("professid");
        System.out.println("industryid="+industryid+"positionname="+positionname+"degreeid="+degreeid+"professid="+professid);
        int pageInt = Integer.valueOf(page);
        int limitInt = Integer.parseInt(limit);
        HashMap<String,Object> condition = new HashMap<>();
        if (null!=industryid&&!"".equals((industryid.trim()))&&!"0".equals(industryid.trim())){
            condition.put("industryid",industryid);
        }
        if (null!=positionname&&!"".equals((positionname.trim()))){
            condition.put("positionname",positionname);
        }
        if (null!=degreeid&&!"".equals((degreeid.trim()))&&!"0".equals(degreeid.trim())){
            condition.put("degreeid",degreeid);
        }
        if (null!=professid&&!"".equals((professid.trim()))&&!"0".equals(professid.trim())){
            condition.put("professid",professid);
        }
        int pageInts = (pageInt-1)*limitInt;
        condition.put("pageInts",pageInts);
        condition.put("limitInt",limitInt);
        Map map = enterpriseService.findPositions(condition);
        if (map.size()!=0){
            diagis.setCode(0);
            diagis.setMsg("");
            diagis.setCount((Integer) map.get("count"));
            diagis.setData((List<Position>) map.get("positionList"));
            ResponseUtils.outJson(response,diagis);
        }
    }

}

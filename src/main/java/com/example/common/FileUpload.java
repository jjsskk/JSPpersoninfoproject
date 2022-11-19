package com.example.common;


import com.example.bean.PersonVO;
import com.example.dao.PersonDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
        public PersonVO uploadPhoto(HttpServletRequest request){
            String filename = "";
            int sizeLimit = 15*1024*1024;

            String realPath = request.getServletContext().getRealPath("upload");
            File dir= new File(realPath);
            if(!dir.exists())
                dir.mkdirs();
            PersonVO one= null;
            MultipartRequest multipartRequest = null;
            try {
                multipartRequest = new MultipartRequest(request, realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
                System.out.println(realPath);
                filename= multipartRequest.getFilesystemName("photo");
                one = new PersonVO();
                String seq = multipartRequest.getParameter("seq");
                if(seq!=null && !"".equals(seq))
                    one.setSeq(Integer.parseInt(seq));
                one.setId(multipartRequest.getParameter("id"));
                one.setName(multipartRequest.getParameter("name"));
                one.setPwd(multipartRequest.getParameter("pwd"));
                one.setPhone_num(multipartRequest.getParameter("phone_num"));
                one.setAddress(multipartRequest.getParameter("address"));
                one.setGender(multipartRequest.getParameter("gender"));
                if(multipartRequest.getParameter("hobby_movie")!=null)
                one.setHobby_movie(Integer.parseInt(multipartRequest.getParameter("hobby_movie")));
                if(multipartRequest.getParameter("hobby_health")!= null)
                one.setHobby_health(Integer.parseInt(multipartRequest.getParameter("hobby_health")));
                if(multipartRequest.getParameter("hobby_sew")!= null)
                one.setHobby_sew(Integer.parseInt(multipartRequest.getParameter("hobby_sew")));
                one.setMajor(multipartRequest.getParameter("major"));
                one.setBirth(multipartRequest.getParameter("birth"));
                one.setContent(multipartRequest.getParameter("content"));
                if (seq != null &&!"".equals(seq)){ //edit 인경우
                    PersonDAO personDAO = new PersonDAO();
                    String oldfilename = personDAO.getPhotoFilename(Integer.parseInt(seq));
                    if(filename != null && oldfilename != null)
                        FileUpload.deleteFile(request, oldfilename);
                    else if(filename==null && oldfilename!=null)
                        filename = oldfilename;

                }
                if(filename == null)
                    filename="";
                one.setPhoto(filename);


            } catch (IOException e) {
                e.printStackTrace();
            }
            return one;
        }
        public static void deleteFile(HttpServletRequest request, String filename){
            String filepath= request.getServletContext().getRealPath("upload");
            File f =new File(filepath + "/" + filename);
            if(f.exists())
                f.delete();
        }
}

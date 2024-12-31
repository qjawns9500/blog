package com.collab.controller;

import com.collab.dto.NoticeDto;
import com.collab.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class NoticeController  extends ExceptionController {
    @Autowired
    private NoticeService noticeService;

    //공지 리스트(List)
    @RequestMapping(value="/notice" ,method = RequestMethod.GET)
    public String noticeList(Model model)throws Exception{
        model.addAttribute("noticeList", noticeService.listNotice());
        return "notice/list";
    }

    //공지 리스트(List) 비동기
    @RequestMapping(value="/notice-json" ,method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<NoticeDto>> getNoticesJson()throws Exception{
        List<NoticeDto> notices = noticeService.listNotice();
        return ResponseEntity.ok().body(notices);
    }

    //공지글 작성(NoticeSave)
    @RequestMapping(value="/notice/save" ,method = RequestMethod.GET)
    public String noticeSave(){
        return "notice/saveForm";
    }

    //공지 등록(NoticePOST)
    @RequestMapping(value = "/createNotice" , method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> noticeCreate(@RequestBody NoticeDto noticeDto) {
        noticeService.saveNotice(noticeDto);
        return ResponseEntity.ok().body("SUCCESS");
    }

    //공지상세(Notice Detail)
    @RequestMapping(value = "/notice/{noticeId}")
    public String noticeDetail(@PathVariable int noticeId, Model model) throws Exception{
        model.addAttribute("noticeDetail", noticeService.getNoticeDetail(noticeId));
        return "notice/detail";
    }

    //공지 게시글 조회수 증가
    @RequestMapping(value = "/increaseNoticeViewcnt/{noticeId}", method = RequestMethod.POST)
    public ResponseEntity<String> handleNoticeViewCnt(@PathVariable int noticeId) throws Exception{
        noticeService.increaseNoticePostViewcnt(noticeId);
        return ResponseEntity.ok().body("SUCCESS");

    }

}

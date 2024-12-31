package com.collab.controller;

import com.collab.dto.*;
import com.collab.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class MeetingController extends ExceptionController {

    @Autowired
    private MeetingService meetingService;

    //메인폼
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {
        return "redirect:/mainForm.do";
    }


    //메인폼
    @RequestMapping(value = "/mainForm.do", method = RequestMethod.GET)
    public String mainForm(Authentication auth, HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(); // ?
        List<MeetingDto> meetings = meetingService.listMeeting();
        List<HashtagDto> hashtags = meetingService.getHashtags();
        model.addAttribute("meetings", meetings);
        model.addAttribute("hashtags", hashtags);
        return "meeting/main";
    }

    //모임 등록폼
    @RequestMapping(value = "/saveForm.do" , method = RequestMethod.GET)
    public String saveForm(){
        return "meeting/saveForm";
    }


    //모임 모집 게시글 불러오기
    @RequestMapping(value = "/meetings-json",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<MeetingDto>> getMeetingsJson() throws Exception {
        List<MeetingDto> meetings = meetingService.listMeeting();
        return ResponseEntity.ok().body(meetings);
    }

    //모임모집 게시글 조회수 증가
    @RequestMapping(value = "/increaseMeetingViewcnt/{regId}", method = RequestMethod.POST)
    public ResponseEntity<String> handleMeetingViewCnt(@PathVariable int regId) throws Exception{
        meetingService.increaseMeetingPostViewcnt(regId);
        return ResponseEntity.ok().body("SUCCESS");
    }

    //모임 상세
    @RequestMapping(value = "/meeting/{regId}" , method = RequestMethod.GET)
    public String detailForm(@PathVariable int regId,Model model) throws Exception{
        MeetingDto meetingDetail =   meetingService.getMeetingDetail(regId);
        model.addAttribute("detail", meetingDetail);
        return "meeting/detailForm";
    }

    //모임 등록(POST)
    @RequestMapping(value = "/createMeeting", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> createMeeting(@RequestBody MeetingDto meetingDto) throws Exception {
        meetingService.saveMeeting(meetingDto);
        meetingService.insertWeeklyrank();
        return ResponseEntity.ok().body("SUCCESS");
    }

    //좋아요(Likes)
    @RequestMapping(value = "/likes/{regId}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> handleLikeRequest(@RequestBody LikesDto likesDto){
        meetingService.updateLikeStatus(likesDto);
        return ResponseEntity.ok().body("SUCCESS");
    }

    //해시태그 랭킹
    @RequestMapping(value = "/rank", method = RequestMethod.GET)
    public String tagrankForm(Model model)throws Exception{
        List<RankingDto> totalRankList = meetingService.getTotalRank();
        List<RankingDto> weeklyRankList = meetingService.getWeeklyRank();

        model.addAttribute("totalRanking", totalRankList);
        model.addAttribute("weeklyRankList", weeklyRankList);
        return "meeting/rankForm";
    }

    //연관 게시글 보여주는 페이지
    @RequestMapping (value = "/relate/{tagtypeId}", method = RequestMethod.GET)
    public String relatedForm(@PathVariable int tagtypeId, Model model) throws Exception{
        List<MeetingDto> relatedPosts = meetingService.getRelatedPosts(tagtypeId);
        model.addAttribute("relatedPosts", relatedPosts);
        List<HashtagDto> hashtags = meetingService.getHashtags();
        model.addAttribute("hashtags", hashtags);
        return "meeting/relateForm";
    }
}

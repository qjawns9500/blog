package com.collab.controller.common;

import com.collab.controller.ExceptionController;
import com.collab.dto.EventDto;
import com.collab.service.EventService;
import com.collab.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class EventController  extends ExceptionController {

    @Autowired
    private MeetingService meetingService;

    @Autowired
    private EventService eventService;


    //이벤트 리스트(Event List)
    @RequestMapping(value="/event" ,method = RequestMethod.GET)
    public String eventList(Model model)throws Exception{
        model.addAttribute("eventList",eventService.listEvent());
        return "event/list";
    }

    //이벤트 리스트(Event List)
    @RequestMapping(value="/event-json" ,method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<List<EventDto>> getEventsJson()throws Exception{
        List<EventDto> events = eventService.listEvent();
        return ResponseEntity.ok().body(events) ;
    }

    //이벤트 작성(SAVE Form)
    @RequestMapping(value="/event/save" ,method = RequestMethod.GET)
    public String eventSave(){
        return "event/saveForm";
    }

    //이벤트 등록(POST)
    @RequestMapping(value = "/createEvent" , method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> eventCreate(@RequestBody EventDto eventDto) {
        eventService.saveEvent(eventDto);
        return ResponseEntity.ok().body("SUCCESS");
    }

    //이벤트 상세(Detail)
    @RequestMapping(value="/event/{eventId}" ,method = RequestMethod.GET)
    public String eventDetail(@PathVariable int eventId, Model model) throws Exception{
        model.addAttribute("eventDetail", eventService.getEventDetail(eventId));
        return "event/detail";
    }


    //이벤트게시글 조회수 증가
    @RequestMapping(value = "/increaseEventViewcnt/{eventId}", method = RequestMethod.POST)
    public ResponseEntity<String> handleEventViewCnt(@PathVariable int eventId) throws Exception{
        eventService.increaseEventPostViewcnt(eventId);
        return ResponseEntity.ok().body("SUCCESS");
    }

}

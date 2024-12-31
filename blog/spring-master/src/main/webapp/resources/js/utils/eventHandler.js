let eventHandler = {
    initFunc : function (){
        //저장 버튼 클릭시 이벤트 (이벤트 게시글 저장)
        $("#eventSave").on("click",()=>{
            this.eventSave();
        })
        //이벤트 게시글 클릭시 이벤트(조회수 증가)
        $(".eventId").on("click",(event)=>{
            this.increaseEventViewcnt(event);
        })

    },

    //이벤트 게시글 작성
    eventSave: function (){
        let data = {
            title:$("#eventTitle").val(),
            content:$("#eventContent").val()
        }

        $.ajax({
            type: "POST",
            url: "/createEvent",
            data: JSON.stringify(data),   //JS객체를 JOSN문자열로
            contentType: "application/json;charset=utf-8", // JSON타입을 요청으로 보낸다.
        }).done(function (resp){
            console.log("Success");
            window.location.href = "/event"

        }).fail(function (error){
            console.log(error);
        })
    },
    //이벤트 게시글 조회수 증가
    increaseEventViewcnt: function (event){
        var eventId = $(event.currentTarget).data('event-id');
        console.log("이벤트 아이디",eventId);
        var url = "/increaseEventViewcnt/" + eventId;
        $.ajax({
            type:"POST",
            url:url,
            contentType: "application/json;charset=utf-8",
        }).done(function (){
            console.log(eventId);
        }).fail(function (error){
            console.log(error)
        })
    },

}

eventHandler.initFunc();
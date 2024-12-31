let noticeHandler = {
    initFunc : function (){

        //공지사항 게시글 클릭시 이벤트(조회수 증가)
        $(".noticeId").on("click",(event)=>{
            this.increaseNoticeViewcnt(event);
        })
        //저장 버튼 클릭시 이벤트 (공지 게시글 저장)
        $("#noticeSave").on("click",()=>{
            this.noticeSave();
        })

    },

    //공지게시글 작성
    noticeSave: function () {
        let data = {
            title: $("#noticeTitle").val(), //id가 title인 input태그값을 가져온다.
            content: $("#noticeContent").val(), //id가 content인 content값 가져온다.
        }
        $.ajax({
            type: "POST",
            url: "/createNotice",
            data: JSON.stringify(data),   //JS객체를 JOSN문자열로
            contentType: "application/json;charset=utf-8", // JSON타입을 요청으로 보낸다.
        }).done(function (resp) {
            console.log("Success");
            window.location.href = "/notice"
        }).fail(function (error) {
            console.log("error")
        })
    },

    // 공지사항 게시글 조회수 증가
    increaseNoticeViewcnt: function (event){
        //공지사항 게시글의 Id값을 받아옴
        var noticeId = $(event.currentTarget).data('notice-id');

        console.log("공지사항 아이디",noticeId);
        var url = "/increaseNoticeViewcnt/" + noticeId;
        $.ajax({
            type:"POST",
            url:url,
            contentType: "application/json;charset=utf-8",
        }).done(function (){
            console.log(noticeId);
        }).fail(function (error){
            console.log(error)
        })
    },
}

noticeHandler.initFunc();
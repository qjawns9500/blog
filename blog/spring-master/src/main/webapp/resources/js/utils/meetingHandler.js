let meetingHandler = {

    initFunc: function (){
        //저장 버튼 클릭시 이벤트 ( 모임 게시글 저장)
        $("#meetingSave").on("click", () => {
            this.meetingSave();

        }),
        //모임 모집 게시글 클릭시 이벤트(조회수 증가)
        $(".regId").on("click",(event)=>{
            this.increaseMeetingViewcnt(event);
        }),

        //모임게시글의 좋아요 버튼 클릭시 발생 이벤트
        $("#currentLike").on("click", () => {
            alert("좋아요!")
            this.changeLikesStatus();
        })
    },

    //모임게시글 작성
    meetingSave: function () {
        let parseTag = $("#hashtag").val().replaceAll(" ","").split(",");
        let arrayTag =[];

        // 빈 문자열 제거
        parseTag = parseTag.filter(tag => tag !== "");

        if(parseTag.length !==0){
            for(let i=0;i < parseTag.length ;i++){
                arrayTag.push(parseTag[i]);
            }
        }
        console.log("arrayTag:"+ arrayTag);
        let data = {
            title: $("#title").val(), //id가 title인 input태그값을 가져온다.
            content: $("#content").val(), //id가 content인 content값 가져온다.
            hashtag: arrayTag.length > 0 ? arrayTag : []
        }
        $.ajax({
            type: "POST",
            url: "/createMeeting",
            data: JSON.stringify(data),   //JS객체를 JOSN문자열로
            contentType: "application/json;charset=utf-8", // JSON타입을 요청으로 보낸다.
        }).done(function (resp) {
            console.log("Success"+arrayTag);

            window.location.href = "/"
        }).fail(function (error) {
            console.log("error"+arrayTag);
        })
    },

    //모임모집 게시글 조회수 증가
    increaseMeetingViewcnt: function (event){
        //공지사항 게시글의 Id값을 받아옴
        var regId = $(event.currentTarget).data('meeting-id');

        var url = "/increaseMeetingViewcnt/" + regId;
        $.ajax({
            type:"POST",
            url:url,
            contentType: "application/json;charset=utf-8",
        }).done(function (){
            console.log("regId",regId);
        }).fail(function (error){
        })
    },

    //모임 게시글 좋아요 로직
    changeLikesStatus: function () {
        let data = {
            regId: $("#regId").text()
        }
        $.ajax({
            type: "POST",
            url: `/likes/${data.regId}`,
            data: JSON.stringify(data),   //JS객체를 JOSN문자열로
            contentType: "application/json;charset=utf-8", // JSON타입을 요청으로 보낸다.
        }).done(function (resp) {
            console.log("Success");
        }).fail(function (error) {
            console.log("error")
        })
    }
}

meetingHandler.initFunc();
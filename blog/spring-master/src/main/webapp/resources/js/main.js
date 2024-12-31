const sec01_visual = document.querySelector('.section01')
const sec02Tit = document.querySelectorAll('.section02 .sec02_title');
const sec02CateBox = document.querySelectorAll('.main .content .section02 .sec02_cont .sec02_left_cont .searchCateBox');
const sec02Item = document.querySelectorAll('.section02 .flex-item');
const sec02_rightCont = document.querySelector('.section02 .sec02_right_cont');
const sec02Tl = gsap.timeline({ defaults: { y: '-3vw', opacity: 0, } })

sec02Tl
.from(sec01_visual, {y:0, width: '60%', opacity: 0, transformOrigin:'50% 50%',})
.from([sec02Tit, sec02CateBox], { y: '2vw', opacity: 0,})
.from(sec02Item, { y: '2vw', opacity: 0, stagger: { each: 0.1 }}, '-=0.3')
.from(sec02_rightCont, { y: '2vw', opacity: 0}, '<')
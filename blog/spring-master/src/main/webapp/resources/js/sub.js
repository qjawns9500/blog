const sub_visual = document.querySelector('.sub .visual_section')
const subvisualTl = gsap.timeline({ defaults: { y: '-3vw', opacity: 0, } })

subvisualTl
.from(sub_visual, {y:0, width: '60%', opacity: 0, transformOrigin:'50% 50%',})

/*변수선언시 var(전역변수),let(지역변수),const(상수)*/
let sum =0;
for (var i=1; i<=5; i++){
  sum+=i; //sum=sum+i
  console.log('i=',i,'일때까지 누적돈 합은',sum);
}
console.log('for문끝')
console.log('for문 끝난 후 i값은 '+i);
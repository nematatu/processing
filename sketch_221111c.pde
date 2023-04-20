int i=0;//横に散らす変数
int j=0;//縦に散らす変数
int timeLimit=20;//制限時間
int CountDown;

 
int a=(int)random(216,255);//問題の色をランダムに決める
int b=(int)random(234,255);
int c=(int)random(240,255);
color c2=color(a,b,c);

float c2_Sum=a+b+c;//問題の色のRGBの合計値を取る
float c3_Sum;//33行目で求めた、c3のRGBの合計値を先に宣言している

int x=0;//Scoreの値
  
void setup(){
  size(1200, 900);
  background(255);
  PFont font = createFont("YuGothic", 50);
  textFont(font);
  box();

}
 


void mousePressed(){
 color c3=get(mouseX,mouseY);//クリックした場所のRGB取得
  float r=red(c3);
  float g=green(c3);
  float b=blue(c3);
  c3_Sum=r+g+b;//取得したRGBの合計値
  if (c3 == c2){//正解したら
    fill(255);
    rect(900,175,300,90);//文字被り防止
    fill(0);
    text("Yes!",900,190);//Yes!と表示
    fill(255);
    rect(600,130,300,100);//文字被り防止
    fill(0);
    text("+20",600,150);//画面に-25と表示
    x+=20;//Scoreを＋20する
    box();//場所を更新

  }
  else{
    fill(255);
    rect(900,175,300,90);//文字被り防止
    fill(0);
    text("No!",900,190);//間違ったらNo!と表示
   }
   if(abs(c3_Sum-c2_Sum)>60){//（取得したRGBの合計値）ー（問題のRGBの合計値）　の絶対値が60より大きいとき
     fill(255);
     rectMode(CENTER);
     rect(600,130,300,100);//文字被り防止
     x-=20;//Scoreを-20する
     fill(0);
     text("-25",600,150);//画面に-25と表示
   }
   if(abs(c3_Sum-c2_Sum)>=30 &&abs(c3_Sum-c2_Sum)<60){//絶対値が30以上かつ60未満のとき
     fill(255);
     rectMode(CENTER);
     rect(600,130,300,100);
     x-=10;
     fill(0);
     text("-10",600,150);
   }
   if(abs(c3_Sum-c2_Sum)>=1 &&abs(c3_Sum-c2_Sum)<30){//絶対値が1以上かつ30未満のとき
          fill(255);
           rectMode(CENTER);
     rect(600,130,300,100);
   x-=5;
   fill(0);
   text("-5",600,150);
    }
}




void draw(){//制限時間のコード
  noStroke();
  fill(255);
  rect(500,100,100,100);//文字被り防止
  int ms =millis()/1000;//秒にする
  fill(0);
  CountDown=timeLimit-ms;//カウントダウンを行う
  if(CountDown>0){//制限時間以内なら
    text("COUNT DOWN"+CountDown,100,100);//秒数を表示
  }
  else{//制限時間オーバーなら
    background(255);
    score();
  if(x>=55){
    textSize(200);
    text("Amazing",600,500);
  }
  if(x>=30 && x<55){
    textSize(200);
    text("Nice",600,500);
  }
  if(x<30){
    textSize(200);
    text("Try harder",600,500);
  }
 }
}

void score(){
  textAlign(CENTER);
  textSize(100);
  stroke(0);
  text("SCORE"+x,600,150);
  

}

void box(){//選択肢の15個の四角のコード
   rectMode(CENTER);
  for (i=0; i<5; i++) {
    for (j=0; j<3; j++) {
    color c1=color((int)random(216.255),(int)random(234,255),(int)random(240,255));//白っぽい範囲の中でランダムにRGBを取る
      fill(c1);
      stroke(0);
      rect(140+230*i,310+ 230*j, 160, 160);//散らす
    }  
  }
  fill(c2);
  rect(950,100,130,50);//答えの色の四角形を画面上部に表示
  
  fill(c2);
  rect(140+230*(int)random(0,4),310+230*(int)random(0,2),160,160);//答えの色の四角形をある選択肢の上に一つ表示
}

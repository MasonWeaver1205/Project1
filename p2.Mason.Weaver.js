



let img;
let weatherButton;
let calendarButton;
let healthButton;
let calendarIcon;
let safariIcon;
let youtubeIcon;
let myText;
let twitterIcon;
let weatherIcon;
let facebookIcon;
let newsIcon;
let healthIcon;
let mouseX;
let mouseY;
let temperature = 0;
// We're going to store text about the weather
let weather = "";
let weatherOn = false;
let newsOn = false;
let json;
let json2;
let json3;





let articleTitle1 = "";
let articleTitle2 = "";
let articleTitle3 = "";
let articleTitle4 = "";
let articleTitle5 = "";

let CalendarTitle1 = "";
let CalendarTitle2 = "";
let CalendarTitle3 = "";
let CalendarTitle4 = "";
let CalendarTitle5 = "";


let dataChart = []



let articleInfo

let clickedAgain = -1;
let weatherClickedAgain = -1;
let calendarClickedAgain = -1;
let healthClickedAgain = -1;


let speech_rec_result = `captured: `
let prompt = 'magic mirror on the wall'

let _canvas  = {w:500, h:330}

 let command_ready = false
 let _draw_temp = false

 let gif;
 let curr_temp
 let curr_short_forecast


let language = navigator.language || 'en-US';
let speech_rec = new p5.SpeechRec(language, speech_result);



function preload() {
    img = loadImage('assets/MirrorDesign.jpg');
    safariIcon = loadImage('assets/safari-icon-7.png');
    calendarIcon = loadImage('assets/calendarIconbg.png');
    youtubeIcon = loadImage('assets/YoutTube.png');
    twitterIcon = loadImage('assets/twitterIcon-removebg.png');
    weatherIcon = loadImage('assets/weatherIcon.png');
    facebookIcon = loadImage('assets/facebookIcon-removebg.png');
    newsIcon = loadImage('assets/Apple_News_icon_(iOS).png');
    healthIcon = loadImage('assets/apple-health.png');

    let url = "https://api.openweathermap.org/data/2.5/weather?q=Lubbock&units=imperial&APPID=e812164ca05ed9e0344b89ebe273c141";
    json = loadJSON(url);

    let url2 = "News.json"
    json2 = loadJSON(url2);

    let url3 = "Calendar.json"
    json3 = loadJSON(url3);

}




function setup() {
    createCanvas(1500, 700);





     speech_rec.start(true, false);




    // Get the temperature
    temperature = json.main.temp;

    // Grab the description, look how we can "chain" calls.
    weather = json.weather[0].description;




    myText = "";



    let col = color(25, 23, 200, 0);

    weatherButton = createButton('');

    weatherButton.size(40,40);
    weatherButton.position(867, 128);
    weatherButton.style('background-color',col);
    weatherButton.style('border-color',col); //turns the border color off
    weatherButton.mousePressed(displayWeatherMenu);

    calendarButton = createButton('');

    calendarButton.size(40,40);
    calendarButton.position(605, 188);
    calendarButton.style('background-color',col);
    calendarButton.style('border-color',col); //turns the border color off
    calendarButton.mousePressed(displayCalendarMenu);

    healthButton = createButton('');

    healthButton.size(38,38);
    healthButton.position(868, 308);
    healthButton.style('background-color',col);
    healthButton.style('border-color',col); //turns the border color off
    healthButton.mousePressed(displayHealthMenu);


    newsButton = createButton('');

    newsButton.size(36,36);
    newsButton.position(868, 245);
    newsButton.style('background-color',col);
    newsButton.style('border-color',col); //turns the border color off
    newsButton.mousePressed(displayNewsMenu);


    // array data filled with objects
    // Objects are variables too. But objects can contain many values.
    // The values are written as name:value pairs
    // (name and value separated by a colon)
    dataChart = [
        {size:99, label:"Light Sleep"},
        {size:67, label:"Deep Sleep"},
        {size:97, label:"Heart Rate"},
        {size:92, label:"Hydration"},
        {size:90, label:"Form"},
        {size:78, label:"Calories"},
        {size:95, label:"Intensity"},
        {size:85, label:"Muscle Mass"},
        {size:83, label:"Fat/Muscle"},
        {size:80, label:"Stamina"},


    ]

    colors = [color(55, 255, 0),
        color(204, 255, 0),
        color(238, 255, 0),
        color(255, 212, 0),
        color(255, 182, 0),
        color(255, 157, 0),
        color(255, 123, 0),
        color(255, 97, 0),
        color(255, 63, 0),
        color(255, 16, 0)]


    noStroke();




    // Top-left corner of the img is at (0, 0)
    // Width and height are the img's original width and height

}

function draw() {
    background(220);



    if (command_ready){
        command_prompt()
    }
    if (_draw_temp){
        draw_temp()
    }


   // image(img, 275, 0, 946, 946);
   // image(safariIcon, 600, 120, 35, 35);
   // image(calendarIcon, 597, 180, 40, 40);

   // image(youtubeIcon, 600, 240, 33, 33);

   // image(twitterIcon, 600, 300, 35, 35);

   // image(weatherIcon, 860, 120, 40, 40);

   // image(facebookIcon, 857, 180, 43, 43);

   // image(newsIcon, 859, 240, 41, 41);

   // image(healthIcon, 860, 300, 38, 38);

    text(myText,10,30);
    if(clickedAgain == 0)
    {
        textSize(20);
        text("News Feed:", width/2, height/2);
        text(articleTitle1, width/2, height/2 + 30);
        text(articleTitle2, width/2, height/2 + 60);
        text(articleTitle3, width/2, height/2 + 90);
        text(articleTitle4, width/2, height/2 + 120);
        text(articleTitle5, width/2, height/2 + 150);
    }
    if(clickedAgain == 1)
    {
        clickedAgain = -1;
    }





    if(weatherClickedAgain == 0)
    {
        textSize(20);
        text("City: Lubbock", width/2, height/2);
        text("Current temperature: " + temperature, width/2, height/2 + 30);
        text("Forecast: " + weather, width/2, height/2 + 60);
    }
    if(weatherClickedAgain == 1)
    {
        weatherClickedAgain = -1;
    }


    if(calendarClickedAgain == 0)
    {
        textSize(18);
        text("Upcoming dates:", width/2 - 90, height/2);
        text(calendarTitle1, width/2-56, height/2 + 30);
        text("Nov 20th",width/2 + 120, height/2+30);
        text(calendarTitle2, width/2-71, height/2 + 60);
        text("Nov 26th",width/2 + 120, height/2+60);
        text(calendarTitle3, width/2-105, height/2 + 90);
        text("Dec 13th",width/2 + 120, height/2+90);
        text(calendarTitle4, width/2-80, height/2 + 120);
        text("Dec 26th",width/2 + 120, height/2+120);
        text(calendarTitle5, width/2-98, height/2 + 150);
        text("Dec 30th",width/2 + 120, height/2+150);
    }
    if(calendarClickedAgain == 1)
    {
        calendarClickedAgain = -1;
    }

    if(healthClickedAgain == 0)
    {
        textSize(20)
        fill(0)
        //textStyle(BOLD)
        text('Health and Fitness',width/2,height/2+0)
        textSize(12)
        push()
        translate(width/2-130,height/2 + 200)
        //
        dataChart.forEach((el,i) => {
            push()
            translate(i * 25, 0)
            let c = floor(map(el.size,23,99,0,9))
            fill(colors[c])
            rect(0,0,20,-el.size*1.5)
            fill(28, 110, 127)
            push()
            translate(0,-50)
            text(el.size,9,-105)
            rotate(HALF_PI)
            fill(255)
            textStyle(ITALIC)
            text(el.label,0,-6)
            pop()
            pop()
        })
        pop()

    }
    if(healthClickedAgain == 1)
    {
        healthClickedAgain = -1;
    }


     textAlign('center', 'center')
     textSize(10);
     textFont('Helvetica');
     text(speech_rec_result, _canvas.w/2, _canvas.h - 20);






 }

 function command_prompt(){
//     gif.show()

     image(img, 275, 0, 946, 946);

     image(safariIcon, 600, 120, 35, 35);
     image(calendarIcon, 597, 180, 40, 40);

     image(youtubeIcon, 600, 240, 33, 33);

     image(twitterIcon, 600, 300, 35, 35);

     image(weatherIcon, 860, 120, 40, 40);

     image(facebookIcon, 857, 180, 43, 43);

     image(newsIcon, 862, 240, 34, 34);

     image(healthIcon, 860, 300, 38, 38);

     clock();

    speech_rec_result = '';






    }

function speech_result(){
    if (speech_rec.resultString == prompt && speech_rec.resultConfidence > .9){
        command_ready = true;
    }
    if (speech_rec.resultValue){
        speech_rec_result = `captured: ${speech_rec.resultString}`
    }
    if (command_ready && speech_rec.resultString == 'show weather'){
        command_ready = false
        get_temp().then(()=> draw_temp())
        gif.hide()
    }
}
//function displayMenu
//when startUp button is clicked the overall menu for the smart mirror will be shown






function displayWeatherMenu() {


    //loadJSON('',gotData)
    weatherOn = true;
    weatherClickedAgain = weatherClickedAgain + 1;
}

function gotData(data)
{
   // text(data,10,30)
}

function displayCalendarMenu() {

    textSize(20);
    console.log(json3)
    calendarTitle1 = json3.calendarDate1;
    calendarTitle2 = json3.calendarDate2;
    calendarTitle3 = json3.calendarDate3;
    calendarTitle4 = json3.calendarDate4;
    calendarTitle5 = json3.calendarDate5;

    calendarClickedAgain = calendarClickedAgain + 1;
}

function displayHealthMenu() {

    healthClickedAgain = healthClickedAgain + 1;
}

function displayNewsMenu() {






        console.log(json2)
        articleTitle1 = json2.ArticleTitle1;
        articleTitle2 = json2.ArticleTitle2;
        articleTitle3 = json2.ArticleTitle3;
        articleTitle4 = json2.ArticleTitle4;
        articleTitle5 = json2.ArticleTitle5;
        clickedAgain = clickedAgain + 1;











}

function clock()
{
    fill("black");
    //textFont(clockFont);
    textAlign(CENTER, CENTER);
    textSize(30);
    let Hour = hour();
    let min = minute();

    let noon = Hour >= 12? " PM" : " AM"
    if(min < 10)
        min = "0"+min
    Hour%=12
    text(Hour+":"+min+noon, width/2, 580);
}
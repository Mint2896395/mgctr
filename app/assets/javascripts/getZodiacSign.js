/**
 * Return zodiac sugn by month and day
 *
 * @param day
 * @param month
 * @return {string} name of zodiac sign
 */
function getZodiacSign(day, month) {
  var zodiacSigns = {
    capricorn: "Козерог | capricorn",
    aquarius: "Водолей | aquarius",
    pisces: "Рыбы | pisces",
    aries: "Овен | aries",
    taurus: "Телец | taurus",
    gemini: "Близнецы | gemini",
    cancer: "Рак | cancer",
    leo: "Лев | leo",
    virgo: "Девы | virgo",
    libra: "Весы | libra",
    scorpio: "Скорпион | scorpio",
    sagittarius: "Стрелец | sagittarius"
  };

  if ((month == 1 && day <= 21) || (month == 12 && day >= 22)) {
    return zodiacSigns.capricorn;
  } else if ((month == 1 && day >= 22) || (month == 2 && day <= 21)) {
    return zodiacSigns.aquarius;
  } else if ((month == 2 && day >= 22) || (month == 3 && day <= 21)) {
    return zodiacSigns.pisces;
  } else if ((month == 3 && day >= 22) || (month == 4 && day <= 21)) {
    return zodiacSigns.aries;
  } else if ((month == 4 && day >= 22) || (month == 5 && day <= 21)) {
    return zodiacSigns.taurus;
  } else if ((month == 5 && day >= 22) || (month == 6 && day <= 21)) {
    return zodiacSigns.gemini;
  } else if ((month == 6 && day >= 22) || (month == 7 && day <= 21)) {
    return zodiacSigns.cancer;
  } else if ((month == 7 && day >= 22) || (month == 8 && day <= 21)) {
    return zodiacSigns.leo;
  } else if ((month == 8 && day >= 22) || (month == 9 && day <= 21)) {
    return zodiacSigns.virgo;
  } else if ((month == 9 && day >= 22) || (month == 10 && day <= 21)) {
    return zodiacSigns.libra;
  } else if ((month == 10 && day >= 22) || (month == 11 && day <= 21)) {
    return zodiacSigns.scorpio;
  } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
    return zodiacSigns.sagittarius;
  }
}

function Ascendant(zodiname, birthtimes) {
  var zodiacSigns = {
    capricorn: "Capricorn",
    aquarius: "Aquarius",
    pisces: "Pisces",
    aries: "Aries",
    taurus: "Taurus",
    gemini: "Gemini",
    cancer: "Cancer",
    leo: "Leo",
    virgo: "Virgo",
    libra: "Libra",
    scorpio: "Scorpio",
    sagittarius: "Sagittarius"
  };

  if (zodiname == "Козерог | capricorn") {
    zodiac = 1;
  } else if (zodiname == "Водолей | aquarius") {
    zodiac = 2;
  } else if (zodiname == "Рыбы | pisces") {
    zodiac = 3;
  } else if (zodiname == "Овен | aries") {
    zodiac = 4;
  } else if (zodiname == "Телец | taurus") {
    zodiac = 5;
  } else if (zodiname == "Близнецы | gemini") {
    zodiac = 6;
  } else if (zodiname == "Рак | cancer") {
    zodiac = 7;
  } else if (zodiname == "Лев | leo") {
    zodiac = 8;
  } else if (zodiname == "Девы | virgo") {
    zodiac = 9;
  } else if (zodiname == "Весы | libra") {
    zodiac = 10;
  } else if (zodiname == "Скорпион | scorpio") {
    zodiac = 11;
  } else if (zodiname == "Стрелец | sagittarius") {
    zodiac = 12;
  }

  var pluscal = zodiac + parseInt(birthtimes);
  if (pluscal >= 12) {
    calcu = (pluscal-1) % 12;
  } else {
    calcu = pluscal - 1;
  }

  if (calcu == 1) {
    return zodiacSigns.capricorn;
  } else if (calcu == 2) {
    return zodiacSigns.aquarius;
  } else if (calcu == 3) {
    return zodiacSigns.pisces;
  } else if (calcu == 4) {
    return zodiacSigns.aries;
  } else if (calcu == 5) {
    return zodiacSigns.taurus;
  } else if (calcu == 6) {
    return zodiacSigns.gemini;
  } else if (calcu == 7) {
    return zodiacSigns.cancer;
  } else if (calcu == 8) {
    return zodiacSigns.leo;
  } else if (calcu == 9) {
    return zodiacSigns.virgo;
  } else if (calcu == 10) {
    return zodiacSigns.libra;
  } else if (calcu == 11) {
    return zodiacSigns.scorpio;
  } else if (calcu == 12) {
    return zodiacSigns.sagittarius;
  }
}


function getAge(dateString) {
  var now = new Date();
  var today = new Date(now.getYear(), now.getMonth(), now.getDate());

  var yearNow = now.getYear();
  var monthNow = now.getMonth();
  var dateNow = now.getDate();

  var dob = new Date(
    dateString.substring(6, 10),
    dateString.substring(0, 2) - 1,
    dateString.substring(3, 5)
  );

  var yearDob = dob.getYear();
  var monthDob = dob.getMonth();
  var dateDob = dob.getDate();
  var age = {};
  var ageString = "";
  var yearString = "";
  var monthString = "";
  var dayString = "";

  yearAge = yearNow - yearDob;

  if (monthNow >= monthDob) var monthAge = monthNow - monthDob;
  else {
    yearAge--;
    var monthAge = 12 + monthNow - monthDob;
  }

  if (dateNow >= dateDob) var dateAge = dateNow - dateDob;
  else {
    monthAge--;
    var dateAge = 31 + dateNow - dateDob;

    if (monthAge < 0) {
      monthAge = 11;
      yearAge--;
    }
  }

  age = {
    years: yearAge,
    months: monthAge,
    days: dateAge
  };

  if (age.years > 1) yearString = " years";
  else yearString = " year";
  if (age.months > 1) monthString = " months";
  else monthString = " month";
  if (age.days > 1) dayString = " days";
  else dayString = " day";

  if (age.years > 0 && age.months > 0 && age.days > 0)
    ageString =
      age.years +
      yearString +
      ", " +
      age.months +
      monthString +
      ", and " +
      age.days +
      dayString +
      " old.";
  else if (age.years == 0 && age.months == 0 && age.days > 0)
    ageString = "Only " + age.days + dayString + " old!";
  else if (age.years > 0 && age.months == 0 && age.days == 0)
    ageString = age.years + yearString + " old. Happy Birthday!!";
  else if (age.years > 0 && age.months > 0 && age.days == 0)
    ageString =
      age.years + yearString + " and " + age.months + monthString + " old.";
  else if (age.years == 0 && age.months > 0 && age.days > 0)
    ageString =
      age.months + monthString + " and " + age.days + dayString + " old.";
  else if (age.years > 0 && age.months == 0 && age.days > 0)
    ageString =
      age.years + yearString + " and " + age.days + dayString + " old.";
  else if (age.years == 0 && age.months > 0 && age.days == 0)
    ageString = age.months + monthString + " old.";
  else ageString = "Oops! Could not calculate age!";

  return ageString;
}


function chinese_zodiac(year) {
  switch ((year - 4) % 12) {
    case 0:
      return "Rat";

    case 1:
      return "Ox";

    case 2:
      return "Tiger";

    case 3:
      return "Rabbit";

    case 4:
      return "Dragon";

    case 5:
      return "Snake";

    case 6:
      return "Horse";

    case 7:
      return "Goat";

    case 8:
      return "Monkey";

    case 9:
      return "Rooster";

    case 10:
      return "Dog";

    case 11:
      return "Pig";
  }
}

/*$("input")
  .keyup(function() {
    var year = $(this).val(),
      zodiac = chinese_zodiac(year);
    $("#zodiac").text(year + " is the year of the " + zodiac);
  })
  .keyup();*/


function y2k(number) {
  return number < 1000 ? number + 1900 : number;
}

function makeArray() {
  this[0] = makeArray.arguments.length;
  for (i = 0; i < makeArray.arguments.length; i++)
    this[i + 1] = makeArray.arguments[i];
}

var daysofweek = new makeArray(
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
);

var monthsofyear = new makeArray(
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
);

var chinese = new makeArray(
  "Rat",
  "Ox",
  "Tiger",
  "Hare",
  "Dragon",
  "Snake",
  "Horse",
  "Sheep",
  "Monkey",
  "Fowl",
  "Dog",
  "Pig"
);

var branches = new makeArray(
  "Zi",
  "Chou",
  "Yin",
  "Mao",
  "Chen",
  "Si",
  "Wu",
  "Wei",
  "Shen",
  "You",
  "Xu",
  "Hai"
);

var stems = new makeArray(
  "Jia",
  "Yi",
  "Bing",
  "Ding",
  "Wu",
  "Ji",
  "Geng",
  "Xin",
  "Ren",
  "Gui"
);

//1900-2000
var chinesenewyear = new makeArray(
  1.31,
  2.19,
  2.08,
  1.29,
  2.16,
  2.04,
  1.25,
  2.13,
  2.02,
  1.22,
  2.1,
  1.3,
  2.18,
  2.06,
  1.26,
  2.14,
  2.03,
  1.23,
  2.11,
  2.01,
  2.2,
  2.08,
  1.28,
  2.16,
  2.05,
  1.25,
  2.13,
  2.02,
  1.23,
  2.1,
  1.3,
  2.17,
  2.06,
  1.26,
  2.14,
  2.04,
  1.24,
  2.11,
  1.31,
  2.19,
  2.08,
  1.27,
  2.15,
  2.05,
  1.25,
  2.13,
  2.02,
  1.22,
  2.1,
  1.29,
  2.17,
  2.06,
  1.27,
  2.14,
  2.03,
  1.24,
  2.12,
  1.31,
  2.18,
  2.08,
  1.28,
  2.15,
  2.05,
  1.25,
  2.13,
  2.02,
  1.21,
  2.09,
  1.3,
  2.17,
  2.06,
  1.27,
  2.15,
  2.03,
  1.23,
  2.11,
  1.31,
  2.18,
  2.07,
  1.28,
  2.16,
  2.05,
  1.25,
  2.13,
  2.02,
  2.2,
  2.09,
  1.29,
  2.17,
  2.06,
  1.27,
  2.15,
  2.04,
  1.23,
  2.1,
  1.31,
  2.19,
  2.07,
  1.28,
  2.16
);

function DayOfWeek(day, month, year) {
  var a = Math.floor((14 - month) / 12);
  var y = year - a;
  var m = month + 12 * a - 2;
  var d =
    (day +
      y +
      Math.floor(y / 4) -
      Math.floor(y / 100) +
      Math.floor(y / 400) +
      Math.floor(31 * m / 12)) %
    7;
  return d + 1;
}

function Nths(day) {
  if (day == 1 || day == 21 || day == 31) return "st";
  if (day == 2 || day == 22) return "nd";
  if (day == 3 || day == 23) return "rd";
  return "th";
}

function FullDate(day, month, year) {
  return (
    daysofweek[DayOfWeek(day, month, year)] +
    " " +
    day +
    Nths(day) +
    " " +
    monthsofyear[month] +
    " " +
    year
  );
}

function Chinese(day, month, year) {
  if (year > 1900 && year < 1999) {
    var newYear = chinesenewyear[year - 1899];
    var newMonth = Math.floor(newYear);
    var newDay = Math.round(newYear * 100 - newMonth * 100);

    if (month > newMonth || (month == newMonth && day >= newDay)) {
      // this year
      var chineseBranch = (year - 3) % 12;
      var chineseStem = (year - 3) % 10;

      var nextYear = chinesenewyear[year - 1899 + 1];
      var nextMonth = Math.floor(nextYear);
      var nextDay = Math.round(nextYear * 100 - nextMonth * 100);

      var lastDay = nextDay - 1;
      if (lastDay == 0) {
        lastMonth = nextMonth - 1;
        lastDay = 31;
      } else lastMonth = nextMonth;

      chineseyearrange =
        FullDate(newDay, newMonth, year) +
        " - " +
        FullDate(lastDay, lastMonth, year + 1);
    } else {
      // last year
      var chineseBranch = (year - 4) % 12;
      var chineseStem = (year - 4) % 10;

      var oldYear = chinesenewyear[year - 1899 - 1];
      var oldMonth = Math.floor(oldYear);
      var oldDay = Math.round(oldYear * 100 - oldMonth * 100);

      var lastDay = newDay - 1;
      if (lastDay == 0) {
        lastMonth = newMonth - 1;
        lastDay = 31;
      } else lastMonth = newMonth;

      chineseyearrange =
        FullDate(oldDay, oldMonth, year - 1) +
        " " +
        FullDate(lastDay, lastMonth, year);
    }
  } else {
    var chineseBranch = (year - 3) % 12;
    var chineseStem = (year - 3) % 10;
  }

  if (chineseBranch == 0) chineseBranch = 12;

  if (chineseStem == 0) chineseStem = 10;

  chineseyearname =
    "(" + stems[chineseStem] + "-" + branches[chineseBranch] + ")";

  return chinese[chineseBranch];
}

if (location.search.length == 0) {
  var year = parent.year - 0;
  var month = parent.month - 0;
  var day = parent.day - 0;
} else {
  var day = location.search.substring(5, 7) - 0;
  var month = location.search.substring(14, 16) - 0;
  var year = location.search.substring(22) - 0;
}

var today = new Date();
var thisYear = y2k(today.getYear());
var thisMonth = today.getMonth() + 1;
var thisDay = today.getDate();




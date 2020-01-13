"https://www.audible.com/search?keywords=&title="

let booksInfo = document.querySelectorAll(".productListItem");
//NodeList(3) [li.bc-list-item, li.bc-list-item, li.bc-list-item]

let bookInfo = document.querySelectorAll('.productListItem')[0].innerText.split('\n')
bookInfo;
// [
// " Sample",
// "The Pelican Brief",
// "By: John Grisham",
// "Narrated by: Anthony Heald",
// "Length: 5 hrs and 36 mins",
// "Release date: 12-15-99",
// "Language: English",
// " ",
// " ",
// "4.5 out of 5 stars",
// "579 ratings",
// "",
// "Regular price: $19.93",
// "",
// "Free with 30-day Trial"
// ];

bookInfo[1] //title => "The Pelican Brief"
bookInfo[2] //author => "By: John Grisham"
bookInfo[4] //length => "Length: 5 hrs and 36 mins"
bookInfo[9] //rating => "4.5 out of 5 stars"

document.querySelectorAll("img.bc-image-inset-border");
//NodeList(3) [img.bc-pub-block., img.bc-pub-block., img.bc-pub-block.]
document.querySelectorAll("img.bc-image-inset-border")[0].src;
//"https://m.media-amazon.com/images/I/41w05ftX6JL._SL500_.jpg";

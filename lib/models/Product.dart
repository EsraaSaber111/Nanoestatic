
import 'package:flutter/material.dart';
class Product{
  final int id;
  final String name,description,img,category;
  final List<String> images;
  final double rating , price , newprice;
  final bool isFavourite, isPopular;

  Product({
    this.id,
    this.rating,
    this.images,
    this.name,
    this.img,
    this.category,
    this.price,
    this.newprice,
    this.description,
    this.isPopular,
    this.isFavourite});
}

List<Product> men=[];
List<Product> women=[];
List<Product> kids=[];
List<Product> body=[];


List<Product> courses = [
  Product(
      id: 10,
      name: 'Course 1',
      description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',      rating: 4,
      isFavourite: true,
      img:
      "assets/images/course.jpg",
      price: 500

  ),
  Product(
      id:11,
      name: 'Course 2',
      description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',       isFavourite: false,
      img:
      "assets/images/course.jpg",
      price: 500

  ),
  Product(
      id: 12,
      name: 'Course 3',
      description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',       rating: 4,
      isFavourite: true,
      img:
      "assets/images/course.jpg",
      price: 500

  ),
  Product(
      id: 13,
      name: 'Course 4',
      description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',       rating: 4,
      isFavourite: false,
      img:
      "assets/images/course.jpg",
      price: 500

  ),
  Product(
      id: 15,
      name: 'Course 5',
      description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',       isFavourite: true,
      img:
      "assets/images/course.jpg",
      price: 500

  ),
  Product(
      id: 16,
      name: 'Course 6',
      description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',       rating: 4,
      isFavourite: true,
      img:
      "assets/images/course.jpg",
      price: 500

  ),
  Product(
      id: 17,
      name: 'Course 7',
      description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',       rating: 4,
      isFavourite: false,
      img:
      "assets/images/course.jpg",
      price: 500

  ),
  Product(
      id: 18,
      name: 'Course 8',
    description: '\n- Item 1\n- Item 2\n- Item 3\n- Item 4\n- Item 5\n- Item 6 ',       rating: 4,
      isFavourite: true,
      price: 500,
    img:
    "assets/images/course.jpg",

  ),
];


List<Product>sliderdemo=[
  Product(
    id: 1,
    name: 'Nothern Mountain',
    img:
    "assets/images/meso.png",
    rating: 4,
  ),
  Product(
    id: 1,
    name: 'Nothern Mountain',
    img: "assets/images/mes01.png",


    rating: 5,

  ),
  Product(
    id: 1,
    name: 'Nothern Mountain',
    img:
    "assets/images/meso3.png",
    rating: 3,

  ),
];


List<Product> allproducts=demoProducts+offeredProducts;

List<Product> demoProducts = [
  Product(
      id: 1,
      name: 'densimatrix',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png",
      ],
      rating: 4,
      category: 'men',
      isFavourite: true,
      isPopular: true,
      price: 500

  ),
  Product(
      id: 2,
      name: 'dermamelan',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      category: 'body',
      images: [  "assets/images/3.png",
        "assets/images/1.png",
        "assets/images/2.png",

        "assets/images/4.png",
      ],
      rating: 3,
      isFavourite: false,
      isPopular: true,
      price: 130
  ),
  Product(
      id: 3,
      name: 'the element',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      images: [
        "assets/images/2.png",
        "assets/images/1.png",

        "assets/images/3.png",
        "assets/images/4.png",
      ],
      rating: 5,
      category: 'kids',
      isFavourite: true,
      isPopular: false,
      price: 100
  ),
  Product(
      id: 4,
      name: 'proteoglycans',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      images: [
        "assets/images/4.png",
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",

      ],
      rating: 3,
      category: 'body',
      isFavourite: true,
      isPopular: true,
      price: 900
  ),
];


List<Product> offeredProducts = [
  Product(
      id: 40,
      name: 'densimatrix',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      images: [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png",
      ],
      rating: 4,
      category: 'women',
      isFavourite: true,
      isPopular: true,
      price: 500,
      newprice: 250,

  ),
  Product(
      id: 50,
      name: 'dermamelan',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      category: 'men',
      images: [  "assets/images/3.png",
        "assets/images/1.png",
        "assets/images/2.png",

        "assets/images/4.png",
      ],
      rating: 3,
      isFavourite: false,
      isPopular: true,
      price: 260,
    newprice: 130
  ),
  Product(
      id: 60,
      name: 'the element',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      images: [
        "assets/images/2.png",
        "assets/images/1.png",
        "assets/images/3.png",
        "assets/images/4.png",
      ],
      rating: 5,
      category: 'men',
      isFavourite: true,
      isPopular: false,
      price: 700,
    newprice: 350
  ),
  Product(
      id: 70,
      name: 'proteoglycans',
      description: '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      images: [
        "assets/images/4.png",
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",

      ],
      rating: 3,
      category: 'women',
      isFavourite: true,
      isPopular: true,
      price: 900,
    newprice: 750
  ),
];

selectcategory(List<Product> product){

  for(int i=0;i<product.length;i++){
    if(product[i].category=='men'){
      men.add(product[i]);
    }else if(product[i].category=='women'){
     women.add(product[i]);
    }
    else if(product[i].category=='kids'){
      kids.add(product[i]);
    }  else if(product[i].category=='body'){
      body.add(product[i]);
    }
    else{
      return;
    }
  }

}
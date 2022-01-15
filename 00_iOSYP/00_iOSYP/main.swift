//
//  main.swift
//  00_iOSYP
//
//  Created by Dogukan Berk Ozer on 14.01.2022.
//

import Foundation

//  Ekrandan alınan, iki tamsayı arasında üretilen rastgele sayının ekrana yazılması

var firstNumber : Int?, secondNumber : Int?

repeat {

    print("Enter first integer number: ")
    firstNumber = Int(readLine()!)
    print("Enter second integer number: ")
    secondNumber = Int(readLine()!)

} while (firstNumber == nil || secondNumber == nil || firstNumber! % 1 != 0 || secondNumber! % 1 != 0);

let randomInt = Int.random(in: firstNumber!...secondNumber!)

print(randomInt)

 



//  Ekrandan girilen notun harf karşılığının gösterilmesi.

var grade : Int?

print("Please enter the grade: ")
grade = Int(readLine()!)

if (grade! <= 100 && grade! > 80){
    print("Letter grade of the entered score is A")
} else if (grade! <= 80 && grade! > 60){
    print("Letter grade of the entered score is B")
}else if (grade! <= 60 && grade! > 40){
    print("Letter grade of the entered score is C")
}else if (grade! <= 40 && grade! >= 0){
    print("Letter grade of the entered score is D")
}else {
    print("Entered INVALID grade!")
}





//  İki boyutlu düzlemde 4 birimlik yarıcapındaki cemberin içinde rasgele üretilen 100 noktadan, 1 birim yaricapi olan daire üzerine ve içine düşenlerin ekrana yazdırılması

var randomX : Double
var randomY : Double
var distance : Double

for _ in 0..<100 {

    randomX = Double.random(in: -4...4)
    randomY = Double.random(in: -4...4)

    distance = sqrt(pow(randomX - 0, 2.0) + pow(randomY - 0, 2.0))

    if (distance < 1) {
        print("( \(randomX) , \(randomY)")
    }

}
 




//  Bir sayı listesindeki tek ve çift sayıları ayrı listelere aktarıp listelerin ikisini de ayrı ayrı ekrana yazdıran kodu yazınız

let intList : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var evenList : [Int] = []
var oddList : [Int] = []

for currentNumber in intList {

    if(currentNumber % 2 == 0){
        evenList.append(currentNumber)
    }else {
        oddList.append(currentNumber)
    }
}

print("Even numbers: \(evenList) \nOdd numbers: \(oddList)")

 



// Parametre olarak tamsayı listesi alan geriye listedeki min, max değerleri dönen bir fonksiyon yazınız

func minMax(list: [Int]) -> (min: Int, max: Int) {
    var currentMin = list[0]
    var currentMax = list[0]
    for value in list[1..<list.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

print(minMax(list: [2,3,5,8,13,21,34,55,89]))





//  Verilen tamsayı listesindeki verileri kontrol edip. Eğer listedeki eleman sayısı 10 dan küçükse string olarak sonuc değeri alan bir işlevi tetikleyen ve parametre olarak "Eleman sayısı yetersiz" metnini gönderen,  eğer 10 dan büyükse sayıların aritmetik ortalamasını hesaplayıp kendisine gönderilen farklı bir işleve gönderen fonksiyonu yazınız.

func calculateAvg(numbers : [Double], errorFunc : ((_ : String) -> Void), resultFunc : ((_ average: Double) -> Void))
{
    if(numbers.count < 10)
    {
        errorFunc("insufficient number of staff!")
    }
    else
    {
        var sum = 0.0
        for i in numbers
        {
            sum += i
        }
        
        let average = sum / Double(numbers.count)
        resultFunc(average)
    }
}

func errorFunc(msg : String)
{
    print(msg)
}

func resultFunc(average : Double)
{
    print("Average of the numbers : \(average)")
}

let numbers : [Double] = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

calculateAvg(numbers: numbers, errorFunc: errorFunc, resultFunc: resultFunc)

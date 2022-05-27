db = connect('localhost:27017');

show dbs

use lab8

db.createCollection('apartment_building')

db.createCollection('building')

db.createCollection('debt')

db.createCollection('expense')

db.createCollection('payment')

db.createCollection('person')

db.createCollection('person_has_flat')

db.createCollection('service')

db.createCollection('utility_rate')

// 3.1 Отобразить коллекции базы данных
show collections

db.person_has_flat.drop()

// 3.2.1 Вставка одной записи через insertOne()
db.getCollection('person').insertOne({
    first_name: "Leanne",
    last_name: "Graham",
    date_birth: Date(),
    phone: "17707368031",
    bank_account: "40817810099910004312",
})

// 3.2.2 Вставка нескольких записей через insertMane()
db.getCollection('person').insertMany([{
    first_name: "Ervin",
    last_name: "Howell",
    date_birth: new Date("1999-05-23"),
    phone: "0106926593",
    bank_account: "40817810099810002875",
},
{
    first_name: "Clementine",
    last_name: "Bauch",
    date_birth: new Date("1987-04-27"),
    phone: "14631234447",
    bank_account: "40817810099810002877",
}
])

db.getCollection('person').insertMany([{
    first_name: "Chelsey",
    last_name: "Dietrich",
    date_birth: new Date("2000-05-20"),
    phone: "2549541289",
    bank_account: "40721810086710000805",
},
{
    first_name: "Kurtis",
    last_name: "Dietrich",
    date_birth: new Date("2000-05-20"),
    phone: "2100676132",
    bank_account: "40721205086710000946",
}
])

// 3.3.1 Удаление одной записи по условию deleteOne
db.getCollection('person').deleteOne({ last_name: "Graham" })

// 3.3.2 Удаление несколких записей по условию deleteMany
db.getCollection('person').deleteMany({ last_name: "Dietrich" })

// 3.4.1 Поиск по ID
db.getCollection('person').findOne({ _id: ObjectId("62909637da4015446889d9a4") })

// 3.4.2 Поиск записи по атрибуту первого уровня
db.getCollection('person').findOne({ first_name: "Clementine" })

db.getCollection('utility_rate').insertOne({
    name: "heating",
    description: {
        title: "Utility rate for heating",
        content: "The tariff is used to pay for heating during the cold season"
    },
    price: 1325.12,
    date_start: new Date("2022-02-01"),
    date_end: new Date("2022-03-01"),
})

// 3.4.3 Поиск записи по вложенному атрибуту
db.getCollection('utility_rate').findOne({ "description.title": "Utility rate for heating"})

// 3.4.4 Поиск записи по нескольким атрибутам (логический оператор AND)
db.getCollection('person').findOne({
    $and: [
        { last_name: "Dietrich" },
        { date_birth: new Date("2000-05-20") },
    ]
})

// 3.4.5 Поиск записи по нескольким атрибутам (логический оператор OR)
db.getCollection('person').findOne({
    $or: [
        { last_name: "Dietrich" },
        { date_birth: new Date("1987-04-27") },
    ]
})

// 3.4.6 Поиск с использованием оператора сравнения
db.getCollection('person').find({
    date_birth: { $lt: new Date("2000-05-20")},
})

// 3.4.7 Поиск с использованием двух операторов сравнения
db.getCollection('person').find({
    $and: [
        { date_birth: { $lt: new Date("2000-05-20")}},
        { date_birth: { $gt: new Date("1987-04-27")}},
    ]
})

db.getCollection('apartment_building').insertOne({
    type: "brick",
    owner: "Department of Urban Planning Regulation of Moscow",
    address: [{
        city: "Moscow",
        street: "Arbat Street",
        number: 57
    }],
    date_commissioning: Date("1825-06-07"),
    cost: 132456873.12,
})

// 3.4.8 Поиск по значению в массиве
db.getCollection('apartment_building').find({
    "address.number": 57,
})

// 3.4.9 Поиск по количеству элементов в массиве
db.getCollection('apartment_building').find({
    address: { $size: 1 },
})

// 3.4.10 Поиск записей без атрибута
db.getCollection('utility_rate').find({
    "description.title": { $exists: false },
})

db.getCollection('utility_rate').insertOne({
    name: "gas supply",
    description: {
        content: "The tariff is used to pay for gas supply during the whole year"
    },
    price: 12.6,
    date_start: new Date("2022-02-01"),
    date_end: new Date("2022-03-01"),
})

// 3.5.1 Изменить значение атрибута у записи
db.getCollection('utility_rate').updateOne(
    { name: "gas supply" },
    { $set: { price: 14 }}
)

// 3.5.2 Удалить атрибут у записи
db.utility_rate.updateOne(
    { name: "gas supply" },
    { $unset: { "description.content": ""} }
)

// 3.5.3 Добавить атрибут записи
db.utility_rate.updateOne(
    { name: "gas supply" },
    { $set: { "description.content": "The tariff is used to pay for gas supply during the whole year"} }
)

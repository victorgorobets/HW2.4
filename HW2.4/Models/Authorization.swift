struct User {
    let name: String
    let password: String
    let description: String
}

extension User {
    static func getAuthorizationDetails() -> User {
        return User(name: "Victor", password: "12345", description: """
Привет! Я - Виктор. Пару слов о себе:
40 лет, занимаюсь экономикой и медициной.
Живу половину времени в Москве, половину - в Питере.
Увлекаюсь дайвингом и яхтингом.
В данный момент изучею немецкий и конечно же Swift :)
Не ожидал, что быстро затянет, но оказалось интересно и круто, особенно когда стало получаться.
Хочется, наконец, попробовать реализовать пару идей приложений!
"""
        )
    }
}

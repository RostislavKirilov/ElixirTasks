defmodule Book do
  defstruct isbn: "9786192406202",
            author: "Rudyard Kipling",
            title: "The Jungle Book",
            description: "It is about the Jungle",
            price: 22.41,
            genre: "novel"

  def default_book do
    IO.puts("======== Default ==========")
    book = %Book{}
    IO.inspect(book)
  end

  def make_obj(isbn, author, title, description, price, genre) do
    book = %Book{
      isbn: isbn,
      author: author,
      title: title,
      description: description,
      price: price,
      genre: genre
    }

    IO.inspect(book)

    book
  end

  def update_obj(book, isbn, author, title, description, price, genre) do
    updated_book = %Book{
      book
      | isbn: isbn,
        author: author,
        title: title,
        description: description,
        price: price,
        genre: genre
    }

    IO.inspect(updated_book)

    updated_book
  end

  def callstruct do
    default_book()

    isbn = IO.gets("ISBN: ") |> String.trim()
    author = IO.gets("Author: ") |> String.trim()
    title = IO.gets("Title: ") |> String.trim()
    description = IO.gets("Description: ") |> String.trim()

    price = get_float_input("Price: ")
    genre = IO.gets("Genre: ") |> String.trim()

    book = make_obj(isbn, author, title, description, price, genre)

    IO.puts("\nUpdate:")
    new_isbn = IO.gets("new ISBN: ") |> String.trim()
    new_author = IO.gets("new Author: ") |> String.trim()
    new_title = IO.gets("new Title: ") |> String.trim()
    new_description = IO.gets("new Description: ") |> String.trim()
    new_price = get_float_input("new Price: ")
    new_genre = IO.gets("new Genre: ") |> String.trim()

    update_obj(book, new_isbn, new_author, new_title, new_description, new_price, new_genre)
  end

  defp get_float_input(prompt) do
    float_str = IO.gets(prompt) |> String.trim()

    case Float.parse(float_str) do
      {number, ""} -> number
    _ ->
        IO.puts("Invalid input. Please enter a valid float number.")
        get_float_input(prompt)
    end
  end
end

Book.callstruct()

package main

import (
	"bytes"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"image"
	"image/png"
	"log"
	"net/http"
	"os"
)

type Credentials struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

type Response struct {
	AccessToken string `json:"access_token,omitempty"`
	Message     string `json:"message,omitempty"`
}

var validCredentials = Credentials{
	Username: "niggerkiller",
	Password: "niggerkiller",
}

func loginHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	var creds Credentials
	err := json.NewDecoder(r.Body).Decode(&creds)
	if err != nil {
		http.Error(w, "Invalid request payload", http.StatusBadRequest)
		return
	}

	if creds.Username == validCredentials.Username && creds.Password == validCredentials.Password {
		token := "some_access_token" // Здесь вы можете сгенерировать настоящий токен
		response := Response{AccessToken: token}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	} else {
		response := Response{Message: "Invalid credentials"}
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode(response)
	}
}

func getImage(imagePath string) ([]byte, error) {
	// Открываем файл с изображением
	file, err := os.Open(imagePath)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	// Декодируем изображение из файла в формате PNG
	img, _, err := image.Decode(file)
	if err != nil {
		return nil, err
	}

	// Создаем буфер для записи изображения в формате PNG
	pngBuffer := &bytes.Buffer{}

	// Записываем изображение в буфер
	err = png.Encode(pngBuffer, img)
	if err != nil {
		return nil, err
	}

	return pngBuffer.Bytes(), nil
}

func encodeImage(imagePath string) (string, error) {
	imageData, err := getImage(imagePath)
	if err != nil {
		return "", err
	}
	imageString := base64.StdEncoding.EncodeToString(imageData)
	return imageString, nil
}

type Vacancy struct {
	ID           int    `json:"id"`
	Title        string `json:"title"`
	Company      string `json:"company"`
	Date         string `json:"date"`
	Requirements string `json:"requirements"`
	Logo         string `json:"logo"`
	Cost         int    `json:"cost"`
	HasResponses bool   `json:"has_responses"`
}

func main() {
	// res, _ := encodeImage("images/ozon.png")
	// print(res)
	// print("\n")
	// print("\n")
	// res, _ = encodeImage("images/yandex.png")
	// print(res)

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(201)
		fmt.Fprintln(w, "Hello, world!")
	})

	http.HandleFunc("/login", loginHandler)
	http.HandleFunc("/vacancies", func(w http.ResponseWriter, r *http.Request) {
		vacancies := []Vacancy{
			{ID: 1, Title: "Golang разработчик", Company: "Ozon", Date: "15 мая", Requirements: "Опыт с Go", Logo: "images/ozon.png", Cost: 100000, HasResponses: true},
			{ID: 2, Title: "Курьер", Company: "Ozon", Date: "5 апреля", Requirements: "Без опыта", Logo: "images/ozon.png", Cost: 30000, HasResponses: false},
			{ID: 3, Title: "Аналитик данных", Company: "Yandex", Date: "24 апреля", Requirements: "Опыт в аналитике", Logo: "images/yandex.png", Cost: 80000, HasResponses: false},
			{ID: 4, Title: "Java разработчик", Company: "Yandex", Date: "7 июня", Requirements: "Опыт в Java", Logo: "images/yandex.png", Cost: 8000, HasResponses: false},
			// {ID: 5, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			// {ID: 6, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			// {ID: 7, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			// {ID: 8, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			// {ID: 9, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			// {ID: 10, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
		}

		for i := range vacancies {
			res, err := encodeImage(vacancies[i].Logo)
			if err != nil {
				continue
			}
			vacancies[i].Logo = res
		}

		jsonData, err := json.Marshal(vacancies)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		// Set the response headers
		w.Header().Set("Content-Type", "application/json; charset=utf-8")

		// Write the JSON data to the response body
		w.WriteHeader(http.StatusOK)
		w.Write(jsonData)
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}

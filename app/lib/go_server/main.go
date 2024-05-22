package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

<<<<<<< HEAD
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
=======
type Vacancy struct {
	ID           int    `json:"id"`
	Title        string `json:"title"`
	Requirements string `json:"requirements"`
	Logo         string `json:"logo"`
	Cost         int    `json:"cost"`
}

>>>>>>> 6840e6d0333e0eed6b418f773c6a07b68c9514cc
func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(201)
		fmt.Fprintln(w, "Hello, world!")
	})

<<<<<<< HEAD
	http.HandleFunc("/login", loginHandler)
=======
	http.HandleFunc("/vacancies", func(w http.ResponseWriter, r *http.Request) {
		vacancies := []Vacancy{
			{ID: 1, Title: "Software Engineer", Requirements: "Experience with Go", Logo: "https://example.com/logo.png", Cost: 10000},
			{ID: 2, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 3, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 4, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 5, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 6, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 7, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 8, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 9, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
			{ID: 10, Title: "Product Manager", Requirements: "Experience in marketing", Logo: "https://example.com/logo.png", Cost: 8000},
		}

		jsonData, err := json.Marshal(vacancies)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		// Set the response headers
		w.Header().Set("Content-Type", "application/json")

		// Write the JSON data to the response body
		w.WriteHeader(http.StatusOK)
		w.Write(jsonData)
	})

>>>>>>> 6840e6d0333e0eed6b418f773c6a07b68c9514cc
	log.Fatal(http.ListenAndServe(":8080", nil))
}

package main

import (
	"io"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/pushed", pushed)

	http.HandleFunc("/", rootHandler)

	http.ListenAndServeTLS(":443", "cert.pem", "key.pem", nil)
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	if pusher, ok := w.(http.Pusher); ok {
		if err := pusher.Push("/pushed", nil); err != nil {
			log.Println("push failed")
		}
	}

	io.WriteString(w, "hello world")
}

func pushed(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "hello server push")
}

// TODO move the reusable part into a library

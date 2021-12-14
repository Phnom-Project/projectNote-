package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type tshirt struct {
	ID       string  `json:"id"`
	Color    string  `json:"color"`
	Ceremony string  `json:"ceremony"`
	Price    float64 `json:"price"`
}

var tshirts = []tshirt{
	{ID: "1", Color: "Blue", Ceremony: "ChildBirthday", Price: 56.99},
	{ID: "2", Color: "Red", Ceremony: "Anniversary", Price: 17.99},
	{ID: "3", Color: "White", Ceremony: "Christmas", Price: 39.99},
}

func getTshirts(c *gin.Context) { // gin.Context parameter.
	c.IndentedJSON(http.StatusOK, tshirts)
}

func postTshirts(c *gin.Context) {
	var newTshirt tshirt
	// To bind the received JSON to newTshirt, call BindJSON
	if err := c.BindJSON(&newTshirt); err != nil {
		return
	}
	tshirts = append(tshirts, newTshirt)
	c.IndentedJSON(http.StatusCreated, newTshirt)
}
func getTshirtByID(c *gin.Context) {
	id := c.Param("id")
	// Loop over the tshirts list, looking for
	// tshirt whose ID value matches the parameter.
	for _, a := range tshirts {
		if a.ID == id {
			c.IndentedJSON(http.StatusOK, a)
			return
		}
	}
	c.IndentedJSON(http.StatusNotFound, "Not Found")
}
func main() {
	router := gin.Default()
	router.GET("/tshirts", getTshirts)
	router.GET("/tshirts/:id", getTshirtByID)
	router.POST("/tshirts", postTshirts)
	router.Run("localhost:8080")
}

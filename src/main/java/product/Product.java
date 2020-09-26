package product;

import category.Category;

public class Product {

	private int id;
	private String name;
	private String description;
	private double price;
	private short stockqty;
	private short categoryId;

	private int imageId;
	private String ImageUrl;

	public String getImageUrl() {
		return ImageUrl;
	}

	public void setImageUrl(String imageUrl) {
		ImageUrl = imageUrl;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	private Category category = new Category();

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public short getStockqty() {
		return stockqty;
	}

	public void setStockqty(short stockqty) {
		this.stockqty = stockqty;
	}

	public short getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(short categoryId) {
		this.categoryId = categoryId;
	}

	public Product() {
	}

	public Product(int id, String name, String description, double price, short stockqty, short categoryId,
			Category c) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.stockqty = stockqty;
		this.categoryId = categoryId;
		this.category = c;
	}

	public Product(String name, String description, double price, short stockqty, short categoryId, int imageId,
			Category category) {

		this.name = name;
		this.description = description;
		this.price = price;
		this.stockqty = stockqty;
		this.categoryId = categoryId;
		this.imageId = imageId;
		this.category = category;
	}

	public Product(int id, String name, String description, double price, short stockqty, short categoryId,
			String imageUrl, Category category) {

		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.stockqty = stockqty;
		this.categoryId = categoryId;
		this.ImageUrl = imageUrl;
		this.category = category;
	}

	public Product(String name, String description, double price, short stockqty, short categoryId) {
		this.name = name;
		this.description = description;
		this.price = price;
		this.stockqty = stockqty;
		this.categoryId = categoryId;
	}

	public Product(String name, String description, double price, short stockqty, short categoryId, int imageId) {
		this.name = name;
		this.description = description;
		this.price = price;
		this.stockqty = stockqty;
		this.categoryId = categoryId;
		this.imageId = imageId;
	}

	
	public Product(int id, String name, String description, double price, short stockqty, short categoryId) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.stockqty = stockqty;
		this.categoryId = categoryId;
	}
	
	

	public Product(int id, String name, String description, double price, short stockqty, short categoryId,
			int imageId) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.stockqty = stockqty;
		this.categoryId = categoryId;
		this.imageId = imageId;
	}

	public Product(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", stockqty=" + stockqty + ", categoryId=" + categoryId + "]";
	}
}

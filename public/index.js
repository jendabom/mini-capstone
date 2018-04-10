console.log('the js file is being loaded correctly');

var productTemplate = document.querySelector('#product-card');
var productContainer = document.querySelector('.row');

productContainer.appendChild(productTemplate.content.cloneNode(true));
productContainer.appendChild(productTemplate.content.cloneNode(true));
productContainer.appendChild(productTemplate.content.cloneNode(true));
productContainer.appendChild(productTemplate.content.cloneNode(true));
productContainer.appendChild(productTemplate.content.cloneNode(true));
productContainer.appendChild(productTemplate.content.cloneNode(true));

function createElement(name, elements=[], attributes=null) {
	if (!Array.isArray(elements)) {
		[elements, attributes] = [attributes, elements];
		if (value === null) {value = ""};
	}
	const el = document.createElement(name);
	for (const prop in attributes) {
		const attr = attributes[prop];
		console.log(prop, attr);
		if (prop === "style") {
			for (const stl in attr) {
				el.style[stl] = attr[stl];
			}
		} else {
			el.setAttribute(prop, attr);
		}
	}
	// array of elements
	if (Array.isArray(elements) && elements.at(0) instanceof HTMLElement) {
		el.append(...elements);
	// raw HTML
	} else if (typeof elements === "string") {
		el.innerHTML = elements;
	// single element
	} else if (elements instanceof HTMLElement) {
		el.append(elements);
	}
	return el;
}


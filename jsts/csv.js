data = [
	{
		id: 1,
		optional_value: 4,
		name: 'Pedro "owsei" Manse',
		extra: {
			info: {
				name: "uwu",
			},
			stuff: [1,2,3],
		}
	},
	{
		id: 1,
		name: 'Pedro "owsei" Manse',
		extra: {
			info: {
				name: "uwu",
			},
			stuff: [1,"2",3],
		}
	}
]

function escapeValue(value) {
	if (typeof value === "string") {
		return '"'+value.replaceAll('"', '""')+'"';
	} else if (value instanceof Array) {
		return escapeValue(value.map(escapeValue).join(";"));
	} else if (typeof value === "object") {
		throw new Error("Can't store Object as value");
	}
	return value;
}

// WARNING: can't flatten object inside array
function recFlattenObj(obj, prefix) {
	let out = {};
	for (const key in obj) {
		const value = obj[key];
		if (value instanceof Array) {
			out[prefix+key+"[]"] = escapeValue(value);
		} else if (typeof value === "object") {
			out = {...out, ...recFlattenObj(value, prefix+key+".")};
		} else {
			out[prefix+key] = escapeValue(value);
		}
	}
	return out;
}

function flattenObj(obj) {
	return recFlattenObj(obj, "");
}

function getHeaders(flatObjs) {
	return Array.from(new Set(flatObjs.flatMap(Object.keys)))
}

function toCSVString(v) {
	if (v === undefined || v === null) {
		return "";
	}
	return v.toString();
}

function makeCSVRows(flatObjs, header) {
	return flatObjs.map(
		item=>header.map(k=>item[k]).map(toCSVString).join(',')
	).join("\n");
}

// only export this
function makeCSV(data) {
	const flat = data.map(flattenObj);
	const header = getHeaders(flat);
	const csvRows = makeCSVRows(flat, header);
	return header.join(",")+"\n"+csvRows;
}

console.log(makeCSV(data));

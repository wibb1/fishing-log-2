const successColor = (success) => {
		let success_color;
		if (success === 'good') {
			success_color = `is-success`;
		} else if (success === 'bad') {
			success_color = `is-light`;
		}
		return success_color;
	};

export default successColor
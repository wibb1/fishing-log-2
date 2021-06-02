import React, { useState, useEffect } from 'react';
import ShowTile from '../components/ShowTile';

const RecordShowContainer = (props) => {
	const [recordState, setRecordState] = useState({});
  const [speciesState, setSpeciesState] = useState({})

	const recordId = props.match.params.id;

	useEffect(() => {
		fetch(`/api/v1/records/${recordId}`)
			.then((response) => {
				
				if (response.ok) {

					return response;
				} else {
					let errorMessage = `${response.status} (${response.statusText})`,
						error = new Error(errorMessage);
					throw error;
				}
			})
			.then((response) => response.json())
			.then((body) => {
				
				setRecordState(body.record);
        setSpeciesState(body.record.species)
				})
			.catch((error) => console.error(`Error in fetch: ${error.message}`));
	}, []);


	return (  
	<ShowTile
		record={recordState}
    species={speciesState}
	/>
	);
};

export default RecordShowContainer;

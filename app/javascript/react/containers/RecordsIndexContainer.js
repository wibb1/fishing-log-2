import React, { useState, useEffect } from 'react';

import RecordTile from '../components/RecordTile';

const RecordsIndexContainer = (props) => {
	const [records, setRecord] = useState([]);

	const [user, setUser] = useState([]);

	useEffect(() => {
		fetch('/api/v1/records')
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
			.then((response) => {
				setRecord(response.records.records);
				setUser(response.user);
			})
			.catch((error) => console.error(`error in fetch: ${error.message}`));
	}, []);
	
	const recordTiles = records.map((record) => {
    
		return (
			<RecordTile
				key={record.id}
				id={record.id}
				name={record.name}
				success={record.success}
				body={record.body}
				latitude={record.latitude}
				longitude={record.longitude}
				date={record.date}
				time={record.time}			
			/>
		);
	});

	return (
		<div className="container">
			<div className="">
			<h1 className="title center m-md"> Your Spot List</h1>
			</div>
			{recordTiles}
		</div>
	);
};

export default RecordsIndexContainer;

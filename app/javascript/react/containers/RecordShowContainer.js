import React, { useState, useEffect } from "react";
import ShowTile from "../components/ShowTile";
import FishingLogAPI from "../utilities/FishingLogAPI";

const RecordShowContainer = (props) => {
  const [recordState, setRecordState] = useState({});
  const [speciesState, setSpeciesState] = useState({});

  const recordId = props.match.params.id;

  useEffect(() => {
    FishingLogAPI.getData('record', recordId).then((body) => {
      setRecordState(body.record);
      setSpeciesState(body.record.species);
    });
  }, []);

  return <ShowTile record={recordState} species={speciesState} />;
};

export default RecordShowContainer;

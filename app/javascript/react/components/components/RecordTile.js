import React from 'react';
import { Link } from 'react-router-dom';

const RecordTile = ({ name, success }) => {
	const success_color = (success) => {
		let success_color;
		if (success === 'Good') {
			success_color = 'is-success';
		} else {
			success_color = 'is-light';
		}
		return success_color;
	};

	return (
		<div className="tile is-ancestor p-sm">
			<div className="tile is-vertical">
				<div className="tile is-parent">
						<div className={`tile is-child notification ${success_color(success)}`}>
							<div className="box">
								<div className="columns">
									<div className="column">
                    <p className="title is-size-3 is-size-4-touch">{name}</p>
                  </div>
								</div>
							</div>
            </div>
        </div>
      </div>
    </div>
  )
}

export default RecordTile;
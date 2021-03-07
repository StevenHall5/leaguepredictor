import {games} from './datafile.js';
// console.log(games);
// Produce a table with details for all teams

for (let i=1; i<=38; i++) {
	$('#weekSelector').append(`<option value=${i}>${i}</option>`);
}

$('#weekSelector').on('change', function() {
	$('.fixtures').hide();
	$(`#fixturesWeek${$('#weekSelector').val()}`).show();
});








let i=0;
games.forEach(week => {
	i++;
	$('#loadFixtures').append(`
	<div class="fixtures" id="fixturesWeek${i}"></div>`);
	// console.log(week);
	let j=0;
	week.forEach(match => {
		j++;
		$(`#fixturesWeek${i}`).append(`
		<section>
			<div class="homeName">
				<label for="week${i}homeScore${j}" id="week${i}homeTeam${j}">${match[0]}</label for="">
			</div>
			<div class="scoreBox">
				<select class="form-control scores" id="week${i}homeScore${j}">
				<option value=0>0</option>
				<option value=1>1</option>
				<option value=2>2</option>
				<option value=3>3</option>
				<option value=4>4</option>
				<option value=5>5</option>
				</select>
				-
				<select class="form-control scores" id="week${i}awayScore${j}">
				<option value=0>0</option>
				<option value=1>1</option>
				<option value=2>2</option>
				<option value=3>3</option>
				<option value=4>4</option>
				<option value=5>5</option>
				</select>
				</div>
			<div>
				<label for="week${i}awayScore${j}" id="week${i}awayTeam${j}">${match[1]}</label for><br>
			</div>
		</section>
		`);
		// console.log(side);
	});
	$(`#fixturesWeek${i}`).append(`<div class="buttonBox"><button id="subButton${i}" class="btn">Save</button></div>
	`);
});

function getTeamsTable() {

	$.ajax({
		url: "libs/php/premTable.php",
		type: 'POST',
		dataType: 'json',
		
		success: function(result) {

			var data = result.data;			

			$('#dataSpan').html(`
			<table id="dataTable" class="table table-hover table-striped" data-toggle="table collapse">
			<thead>
			<tr>
				<th>
				</th>
				<th>
					Club
				</th>
				<th>
					P
				</th>
				<th>
					W
				</th>
				<th>
					D
				</th>
				<th>
					L
				</th>
				<th>
                    GF	
				</th>
				<th>
                    GA
				</th>
                <th>
					GD
				</th>
                <th>
					Pts
				</th>
			</tr>
		</thead><tbody></tbody></table>`);

			data.forEach(team => {

				$('#dataTable').append(
					
					`<tr id="${team.id}">
					<td><img src="${team.badge}"></td>
					<td>${team.name}</td>
					<td>${team.played}</td>
					<td>${team.won}</td>
					<td>${team.drawn}</td>
					<td>${team.lost}</td>
					<td>${team.goalsFor}</td>
					<td>${team.goalsAgainst}</td>
					<td>${team.goalDifference}</td>
					<td>${team.points}</td>
					</tr>`);

			});

		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error');
		}
	}); 		
	
};

function homeTeam(teamName, weekNumber, fixtureNumber) {

    var goalsFor = $(`#week${weekNumber}homeScore${fixtureNumber}`).val();
    var goalsAgainst = $(`#week${weekNumber}awayScore${fixtureNumber}`).val();
    var goalDifference = goalsFor - goalsAgainst;
    var won;
    var drawn;
    var lost;
    var points;

    if ($(`#week${weekNumber}homeScore${fixtureNumber}`).val() > $(`#week${weekNumber}awayScore${fixtureNumber}`).val()) {
        won = 1;
        drawn = 0;
        lost = 0;
        points = 3;
    } else if ($(`#week${weekNumber}homeScore${fixtureNumber}`).val() < $(`#week${weekNumber}awayScore${fixtureNumber}`).val()) {
        won = 0;
        drawn = 0;
        lost = 1;
        points = 0;
    } else {
        won = 0;
        drawn = 1;
        lost = 0;
        points = 1;
    }

    $.ajax({
		url: "libs/php/updateScores.php",
		type: 'POST',
		dataType: 'json',
		data: {
            name: teamName,
            won: won,
            drawn: drawn,
            lost: lost,
            goalsFor: goalsFor,
            goalsAgainst: goalsAgainst,
            goalDifference: goalDifference,
            points: points
		},
		
		success: function(result) {
				
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error');
		}
	});
}

function awayTeam(teamName, weekNumber, fixtureNumber) {

    var goalsFor = $(`#week${weekNumber}awayScore${fixtureNumber}`).val();
    var goalsAgainst = $(`#week${weekNumber}homeScore${fixtureNumber}`).val();
    var goalDifference = goalsFor - goalsAgainst;
    var won;
    var drawn;
    var lost;
    var points;

    if ($(`#week${weekNumber}homeScore${fixtureNumber}`).val() < $(`#week${weekNumber}awayScore${fixtureNumber}`).val()) {
        won = 1;
        drawn = 0;
        lost = 0;
        points = 3;
    } else if ($(`#week${weekNumber}homeScore${fixtureNumber}`).val() > $(`#week${weekNumber}awayScore${fixtureNumber}`).val()) {
        won = 0;
        drawn = 0;
        lost = 1;
        points = 0;
    } else {
        won = 0;
        drawn = 1;
        lost = 0;
        points = 1;
    }

    $.ajax({
		url: "libs/php/updateScores.php",
		type: 'POST',
		dataType: 'json',
		data: {
            name: teamName,
            won: won,
            drawn: drawn,
            lost: lost,
            goalsFor: goalsFor,
            goalsAgainst: goalsAgainst,
            goalDifference: goalDifference,
            points: points
		},
		
		success: function(result) {

			if (fixtureNumber===10) {
				getTeamsTable();
			}
				
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error');
		}
	});
}

// Update scores
for (let i=1; i<=10; i++) {
	$(`#subButton${i}`).on('click', function() {
		for (let j=1; j<=10; j++) {
			homeTeam($(`#week${i}homeTeam${j}`).html(),i,j);
			awayTeam($(`#week${i}awayTeam${j}`).html(),i,j);
		}
			
	});
}


// Reset table
$('#resetButton').on('click', function() {
    $.ajax({
		url: "libs/php/resetTable.php",
		type: 'POST',
		dataType: 'json',
		
		success: function(result) {
	
            getTeamsTable();
			$('#weekSelector').val(1).change();
			$('.scores').val(0).change();

		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error');
		}
	}); 		
});

// Preloader

$(document).ready(function () {
	if ($('#preloader').length) {
        $('#preloader').delay(100).fadeOut('slow', function () {
            $(this).remove();
        });
	}
	getTeamsTable();
});
import { faker } from '@faker-js/faker';
import fs from 'fs';

const skills = [
  "Lean Manufacturing",
  "Waste Management",
  "Team Leadership",
  "Safety Compliance",
  "Sustainability Planning"
];

let sql = "INSERT INTO candidates (name, experience_years, skills) VALUES\n";

for (let i = 0; i < 40; i++) {
  const name = faker.person.fullName();
  const experience = faker.number.int({ min: 2, max: 15 });
  const skillSet = faker.helpers.arrayElements(skills, 3).join(", ");

  sql += `('${name}', ${experience}, '${skillSet}')${i < 39 ? "," : ";"}\n`;
}

fs.writeFileSync("../database/sample_data.sql", sql);
console.log("40 candidates generated!");

import { Container, Table, Title } from "@mantine/core";
import { rankingData } from "./data";

export default function App() {
  return (
    <Container size="lg" mt="xl">
      <Title order={2} mb="md">
        Recycling Manager Candidate Rankings
      </Title>

      <Table striped highlightOnHover withTableBorder>
        <thead>
          <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Experience (Years)</th>
            <th>Skills</th>
            <th>Total Score</th>
          </tr>
        </thead>
        <tbody>
          {rankingData.map((c) => (
            <tr key={c.rank}>
              <td>{c.rank}</td>
              <td>{c.name}</td>
              <td>{c.experience}</td>
              <td>{c.skills}</td>
              <td>{c.total}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </Container>
  );
}

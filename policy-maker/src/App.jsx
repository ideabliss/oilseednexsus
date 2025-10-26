import { useState } from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Sidebar from './components/Sidebar'
import Header from './components/Header'
import Dashboard from './pages/Dashboard'
import ProductionMap from './pages/ProductionMap'
import Analytics from './pages/Analytics'
import Traceability from './pages/Traceability'
import Financial from './pages/Financial'

function App() {
  const [sidebarOpen, setSidebarOpen] = useState(false)

  return (
    <Router>
      <div className="flex h-screen bg-gray-50">
        <Sidebar open={sidebarOpen} setOpen={setSidebarOpen} />
        <div className="flex-1 flex flex-col overflow-hidden">
          <Header setSidebarOpen={setSidebarOpen} />
          <main className="flex-1 overflow-x-hidden overflow-y-auto bg-gray-50 p-6">
            <Routes>
              <Route path="/" element={<Dashboard />} />
              <Route path="/map" element={<ProductionMap />} />
              <Route path="/analytics" element={<Analytics />} />
              <Route path="/traceability" element={<Traceability />} />
              <Route path="/financial" element={<Financial />} />
            </Routes>
          </main>
        </div>
      </div>
    </Router>
  )
}

export default App
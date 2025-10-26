import { useState } from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Sidebar from './components/Sidebar'
import Header from './components/Header'
import Dashboard from './pages/Dashboard'
import Procurement from './pages/Procurement'
import Warehouse from './pages/Warehouse'
import Logistics from './pages/Logistics'
import Analytics from './pages/Analytics'
import Profile from './pages/Profile'
import Sales from './pages/Sales'

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
              <Route path="/procurement" element={<Procurement />} />
              <Route path="/warehouse" element={<Warehouse />} />
              <Route path="/logistics" element={<Logistics />} />
              <Route path="/analytics" element={<Analytics />} />
              <Route path="/profile" element={<Profile />} />
              <Route path="/sales" element={<Sales />} />
            </Routes>
          </main>
        </div>
      </div>
    </Router>
  )
}

export default App
package com.utopia.gallery;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;
import org.springframework.test.web.servlet.MockMvc;
import org.junit.Test;


import com.utopia.gallery.service.WorksService;
import com.utopia.gallery.web.HomeController;
public class HomeControllerTest {
	
	@Test
	public void testHomePage() throws Exception {
		HomeController controller = new HomeController();
		MockMvc mockMvc = standaloneSetup(controller).build();
		mockMvc.perform(get("/")).andExpect(view().name("fakeSmith"));
	}
	
	public void testDataRetrieval() throws Exception {
		WorksService mockRepository = mock(WorksService.class);
		HomeController controller = new HomeController();
		MockMvc mockMvc = standaloneSetup(controller).build();
	}
}
